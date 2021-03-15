//
//  KingdomViewController.swift
//  Kingdom_Game
//
//  Created by naoto kojima on 2021/03/15.
//

import Foundation
import UIKit

/// 王様画面
class KingdomViewController: BaseViewController {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var kingImage: UIImageView!
    @IBOutlet weak var confirmatinoBtn: UIButton!
    
    // MARK: - func
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initview()
    }
    
    /// 初期画面表示
    private func initview() {
        // label設定
        self.positionLabel.textColor = .black
        self.explainLabel.textColor = .black
        self.positionLabel.text = CommonWords.kingdomViewTitle()
        self.explainLabel.text = CommonWords.explainCitizen()
        self.confirmatinoBtn.setTitle(CommonWords.confirmation(), for: .normal)
    }

    /// confirmation タップ処理
    @IBAction func tappedConfirmation(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
