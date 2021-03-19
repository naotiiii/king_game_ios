//
//  BaseViewController.swift
//  Kingdom_Game
//
//  Created by naoto kojima on 2021/02/25.
//

import Foundation
import UIKit

/// BaseViewController
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    public func okBtnAlert(message: String) {
        let okBtn: UIAlertAction = UIAlertAction.init(title: CommonWords.ok(), style: .default, handler: nil)
        let ac: UIAlertController = UIAlertController.init(title: CommonWords.empty(), message: message, preferredStyle: .alert)
        ac.addAction(okBtn)
        present(ac, animated: true, completion: nil)
    }
}
