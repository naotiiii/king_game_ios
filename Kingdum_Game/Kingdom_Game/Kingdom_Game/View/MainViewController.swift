//
//  ViewController.swift
//  Kingdom_Game
//
//  Created by naoto kojima on 2021/02/23.
//

import UIKit

/// MainViewController
class MainViewController: BaseViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberText: UITextField!
    @IBOutlet weak var explainText: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    
    
    // MARK: - func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }

    // 初期画面設定
    private func initView() {
        // title 設定
        self.title = CommonWords.mainViewNavigationTitle()
        self.titleLabel.text = CommonWords.mainViewLabelTitle()
        self.titleLabel.textColor = .black
        self.startBtn.setTitle(CommonWords.startBtnTitle(), for: .normal)
        // 説明テキスト 設定
        self.explainText.text = CommonWords.explainLabelText()
        self.explainText.textColor = .black
        
         // Color 設定
        self.numberText.backgroundColor = .white
        
        
    }

    // Startボタン タップ時
    @IBAction func tappedStartBtn(_ sender: Any) {
        let sb = UIStoryboard.init(name: "Play", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PlayViewController") as! PlayViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

