//
//  RxSwiftCounterViewModel.swift
//  MVVMDebut
//
//  Created by 三浦　登哉 on 2021/05/16.
//

import RxSwift
import RxCocoa

struct CounterViewModelInput {
    let countUpButton: Observable<Void>
    let countDownButton: Observable<Void>
    let countResetButton: Observable<Void>
}

protocol CounterViewModelOutput {
    var counterText: Driver<String?> { get }
}

protocol CounterViewModelType {
    var outputs: CounterViewModelOutput? { get }
    func setup(input: CounterViewModelInput)
}

final class RxSwiftCounterViewModel: CounterViewModelType {
    var outputs: CounterViewModelOutput?
    
    private let countRelay = BehaviorRelay<Int>(value: 0)
    
    private let initialCount = 0
    
    private let disposeBag = DisposeBag()
    
    init() {
        self.outputs = self
    }
    
    func setup(input: CounterViewModelInput) {
        // 宣言的に処理が記述できる
        // カウントアップボタンタップを検知したら
        input.countUpButton
            .subscribe(onNext: { [weak self] in
                self?.inclementCount()
            })
            .disposed(by: disposeBag)
        
        // カウントダウンボタンタップを検知したら
        input.countDownButton
            .subscribe(onNext: { [weak self] in
                self?.declementCount()
            })
            .disposed(by: disposeBag)
        
        // れセットボタンを検知したら
        input.countResetButton
            .subscribe(onNext: { [weak self] in
                self?.resetCount()
            })
            .disposed(by: disposeBag)
    }
    
    private func inclementCount() {
        let count = countRelay.value + 1
        countRelay.accept(count)
    }
    
    private func declementCount() {
        let count = countRelay.value - 1
        countRelay.accept(count)
    }
    
    private func resetCount() {
        countRelay.accept(initialCount)
    }
}

extension RxSwiftCounterViewModel: CounterViewModelOutput {
    var counterText: Driver<String?> {
        return countRelay
            .map{ String($0) }
            .asDriver(onErrorJustReturn:nil)
    }
}
