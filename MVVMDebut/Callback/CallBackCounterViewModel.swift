//
//  CounterViewModel.swift
//  MVVMDebut
//
//  Created by 三浦　登哉 on 2021/05/16.
//

import Foundation

final class CallbackCounterViewModel {
    
    private(set) var count = 0
    
    func inclementCount(callback: (Int) -> Void) {
        count += 1
        callback(count)
    }
    
    func declementCount(callback: (Int) -> Void) {
        count -= 1
        callback(count)
    }
    
    func resetCount(callback: (Int) -> Void) {
        count = 0
        callback(count)
    }
}
