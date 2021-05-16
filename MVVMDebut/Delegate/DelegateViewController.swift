//
//  DelegateViewController.swift
//  MVVMDebut
//
//  Created by 三浦　登哉 on 2021/05/16.
//

import UIKit

final class DelegateViewController: UIViewController {

    @IBOutlet private weak var countLabel: UILabel!
    
    private let presenter = CounterPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
    }
    
    @IBAction private func countUp(_ sender: Any) {
        presenter.inclementCount()
    }
  
    @IBAction private func countDown(_ sender: Any) {
        presenter.declementCount()
    }
    
    @IBAction private func countReset(_ sender: Any) {
        presenter.resetCount()
    }
    
    private func updataCountlabel(_ count: Int) {
        countLabel.text = String(count)
    }
   
    @IBAction private func shiftToRxSwift(_ sender: Any) {
        self.navigationController?.pushViewController(RxSwiftViewController(), animated: true)
    }
}


extension DelegateViewController: CounterProtocol {
    func updateCount(count: Int) {
        self.updataCountlabel(count)
    }
}
