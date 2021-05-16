//
//  ViewController.swift
//  MVVMDebut
//
//  Created by 三浦　登哉 on 2021/05/15.
//

import UIKit

final class CallbackViewController: UIViewController {
    
    @IBOutlet private  weak var countLabel: UILabel!
    
    private var viewModel: CallbackCounterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CallbackCounterViewModel()
    }
    
    @IBAction private func countUp(_ sender: Any) {
        viewModel.inclementCount { count in
            self.updataCountlabel(count)
        }
    }
    
    @IBAction private func countDown(_ sender: Any) {
        viewModel.declementCount { count in
            self.updataCountlabel(count)
        }
    }
    
    @IBAction private func countReset(_ sender: Any) {
        viewModel.resetCount { count in
            self.updataCountlabel(count)
        }
    }
    
    private func updataCountlabel(_ count: Int) {
        countLabel.text = String(count)
    }
    
    @IBAction func shiftToDelegate(_ sender: Any) {
        self.navigationController?.pushViewController(DelegateViewController(), animated: true)
    }
}

