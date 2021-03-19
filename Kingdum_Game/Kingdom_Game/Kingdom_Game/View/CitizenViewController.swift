//
//  CitizenViewController.swift
//  Kingdom_Game
//
//  Created by naoto kojima on 2021/03/15.
//

import Foundation
import UIKit


class CitizenViewController: BaseViewController {
    @IBOutlet weak var citizenPositionLabel: UILabel!
    @IBOutlet weak var citizenImageView: UIImageView!
    @IBOutlet weak var confirmationBtn: UIButton!
    @IBOutlet weak var explainCitizenLabel: UILabel!
    
    // ユーザー選択人数
    var number: Int = 0
    // 遷移回数
    var displayTimes: Int = 0
    // 表示番号
    var displayNumber = 0
    // ランダム選択番号　配列番号
    var randomInt: Int?
    // ユーザー選択番号配列
    var numberArray: [Int] = []
    
    // MARK: - func
    /// 画面表示する前
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
        self.giveNumber()
    }
    
//    /// 画面移動時
//    override func viewWillDisappear(_ animated: Bool) {
//        self.deleteUsedNo()
//    }
    
    // 初期表示
    private func initView() {
        self.citizenPositionLabel.textColor = .black
        self.navigationItem.hidesBackButton = true
        self.explainCitizenLabel.textColor = .black
        self.explainCitizenLabel.text = CommonWords.explainCitizen()
        self.confirmationBtn.setTitle(CommonWords.confirmation(), for: .normal)
    }

    // 番号処理
    private func giveNumber() {
        // 番号配列作成
        if self.displayTimes == 0 {
            self.numberArray = Array(1...self.number-1)
        }
        self.randomInt = Int.random(in: 0...self.numberArray.count-1)
        print("Citizen No Array: \(self.numberArray)\nArray Count: \(self.numberArray.count)\nRandom Int: \(self.randomInt)")
        self.displayNumber = numberArray[self.randomInt!]
        print("Display No: \(self.displayNumber)")
        self.citizenPositionLabel.text = CommonWords.citizenViewTitle(number: displayNumber)
    }

    // 付与済み番号削除処理
    private func deleteUsedNo() {
        self.numberArray.remove(at: randomInt!)
        print("Removed NumberArray: \(self.numberArray)")
    }
    
    // ボタンタップ
    @IBAction func tappedBtn(_ sender: Any) {
        self.deleteUsedNo()
        let nav = self.navigationController
        let vc = nav?.viewControllers[(nav?.viewControllers.count)!-2] as! PlayViewController
        vc.numberArray = self.numberArray
        vc.displayNumber = self.displayNumber
        self.dismiss(animated: true, completion: nil)
        nav?.popViewController(animated: true)
    }
}
