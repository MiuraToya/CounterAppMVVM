//
//  RxSwiftViewController.swift
//  MVVMDebut
//
//  Created by 三浦　登哉 on 2021/05/16.
//

import UIKit
import RxSwift
import RxCocoa

final class RxSwiftViewController: UIViewController {
    
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var countUpButton: UIButton!
    @IBOutlet private weak var countDownButton: UIButton!
    @IBOutlet private weak var countResetButton: UIButton!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
    }
    
    private func setupViewModel() {
        let viewModel = RxSwiftCounterViewModel()
        let input = CounterViewModelInput(countUpButton: countUpButton.rx.tap.asObservable(),
                                          countDownButton: countDownButton.rx.tap.asObservable(),
                                          countResetButton: countResetButton.rx.tap.asObservable())
        // viewModelとinputを繋ぐ
        viewModel.setup(input: input)
        
        // ViewModelの変更を監視
        // 数字が変更を検知したら、countLabelに値を反映させる
        viewModel.outputs?.counterText
            // 流れてきたイベントをcountLabelのtextプロパティに代入
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
