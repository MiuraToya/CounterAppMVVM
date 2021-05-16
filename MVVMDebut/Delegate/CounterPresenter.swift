//
//  CounterPresenter.swift
//  MVVMDebut
//
//  Created by 三浦　登哉 on 2021/05/16.
//

import Foundation

protocol CounterProtocol {
    func updateCount(count: Int)
}

class CounterPresenter {
    
    private var count = 0 {
        // 値が更新されるたびにupdateCountを呼ばせる
        didSet {
            self.delegate?.updateCount(count: count)
        }
    }
    
    var delegate: CounterProtocol?
    
    func attachView(_ delegate: CounterProtocol) {
        self.delegate = delegate
    }
    
    func detachView() {
        self.delegate = nil
    }
    
    func inclementCount() {
        count += 1
    }
    
    func declementCount() {
        count -= 1
    }
    
    func resetCount() {
        count = 0
    }
}
