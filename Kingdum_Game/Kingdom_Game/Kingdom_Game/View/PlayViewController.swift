//
//  PlayViewController.swift
//  Kingdom_Game
//
//  Created by naoto kojima on 2021/02/25.
//

import Foundation
import UIKit

/// PlayViewController
class PlayViewController: BaseViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var playTitleLabel: UILabel!
    @IBOutlet weak var numberListCollection: UICollectionView!
    // 最後に表示するView
    @IBOutlet weak var finishExampleView: UIView!
    // 例 Label
    @IBOutlet weak var forExampleLabel: UILabel!
    @IBOutlet weak var finishImageView: UIImageView!
    // 番号表示を促す Label
    @IBOutlet weak var finishedExplainLabel: UILabel!
    // 番号紹介 Btn
    @IBOutlet weak var finishNumberBtn: UIButton!
    @IBOutlet weak var backViewBtn: UIButton!
    
    // 人数
    var number: Int = 0
    // コレクション数
    var collectionList: Int = 0
    // 王様番号
    var collectNumber: Int?
    // 選択済み番号
    var selectedNumber: [Int] = []
    // 表示された番号
    var displayNumber: Int?
    // 表示された番号 配列
    var displayNumberArray: [Int] = []
    // 市民画面遷移数
    var count: Int = 0
    // 市民 残り番号 配列
    var numberArray: [Int] = []
    
    //MARK: - func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.reloadView()
        self.numberListCollection.reloadData()
    }
    
    /// 初期設定
    private func initView() {
        hiddenView(isHideen: true)
        self.forExampleLabel.text = CommonWords.forExampleText()
        self.forExampleLabel.backgroundColor = .lightGray
        self.forExampleLabel.textColor = .black
        self.finishedExplainLabel.text = CommonWords.explainDisplayNumber()
        self.finishedExplainLabel.textColor = .black
        self.finishImageView.backgroundColor = .lightGray
        self.finishImageView.image = UIImage.init(named: "img_crown")
        self.finishNumberBtn.setTitle(CommonWords.displayNumberBtnTitle(), for: .normal)
        // タイトルテキスト設定
        self.playTitleLabel.backgroundColor = .white
        self.playTitleLabel.textColor = .black
               
        self.numberListCollection.delegate = self
        self.numberListCollection.dataSource = self
        self.collectionList = number - 1
        self.collctionLayout()
        print("\(self.collectionList)")
        
        // 正解番号付与
        self.collectNumber = Int.random(in: 0...self.collectionList)
        print("\(self.collectNumber)")
        
        // カウントリセット
        self.count = 0
    }
    
    /// 非表示部分設定
    private func hiddenView(isHideen: Bool) {
        self.finishExampleView.isHidden = isHideen
        self.forExampleLabel.isHidden = isHideen
        self.finishedExplainLabel.isHidden = isHideen
        self.finishImageView.isHidden = isHideen
        self.finishNumberBtn.isHidden = isHideen
        self.backViewBtn.isHidden = isHideen
        self.numberListCollection.isHidden = !isHideen
    }
    
    /// 再読み込み
    private func reloadView() {
        // タイトルテキスト
        if self.number == self.selectedNumber.count {
            self.playTitleLabel.text = CommonWords.finishGameTitle()
        } else {
            self.playTitleLabel.text = CommonWords.headderTitle()
        }
        // 選択された番号を順番通り保存
        if let displayNumber = self.displayNumber {
            self.displayNumberArray.append(displayNumber)
        }
        print("\(self.displayNumberArray.count)")
        print("\n番号時表示配列：\(self.displayNumberArray)")
    }
    
    /// 正解の番号を表示する画面
    @IBAction func tappedShowCorrectNumber(_ sender: Any) {
        self.forExampleLabel.backgroundColor = .systemBlue
        print("\(self.displayNumberArray.count)")
        print("\n\(self.displayNumberArray)")
        // 誰がどの番号か正解を表示
        var correctLabel = CommonWords.everyoneNumber()
        for i in 0...self.displayNumberArray.count-1 {
            if self.displayNumberArray[i] == 0 {
                // 王様の場合
                correctLabel += "\n\(i+1)番目： \(CommonWords.king())"
            } else {
                // 市民の場合
                correctLabel += "\n\(i+1)番目： No.\(self.displayNumberArray[i])"
            }
        }
        self.forExampleLabel.text = correctLabel
    }
    
    /// 最初の画面に戻る
    @IBAction func backToFirstScreen(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

/// Collection 設定
extension PlayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // レイアウト設定
    func collctionLayout() {
        let layout = UICollectionViewFlowLayout()
        let bounds = self.numberListCollection.bounds.size
        layout.itemSize = CGSize.init(width: bounds.width/3-30, height: bounds.width/3-30)
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets.init(top: 10, left: 10, bottom: 10, right: 10)
        numberListCollection.collectionViewLayout = layout
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.number == self.selectedNumber.count {
            // 全部選択された時
            self.hiddenView(isHideen: false)
            return 0
        } else {
            // 選択途中
            return number
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionCell
        let label = cell.contentView.viewWithTag(1) as! UILabel
        label.text = CommonWords.collectionTitle()

        if self.selectedNumber != [] {
            var forcedTermination: Bool = false
            for i in 0...self.selectedNumber.count - 1  {
                if !forcedTermination  {
                    if indexPath.row == self.selectedNumber[i] {
                        // 選択されているセル
                        cell.contentView.backgroundColor = .gray
                        cell.isUserInteractionEnabled = false
                        label.text = CommonWords.selectedCellTitle()
                        forcedTermination = true
                    } else {
                        // 選択されていないセル
                        cell.contentView.backgroundColor = .systemBlue
                        cell.isUserInteractionEnabled = true
                    }
                }
            }
        } else {
            cell.contentView.backgroundColor = .systemBlue
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell: CustomCollectionCell = collectionView.cellForItem(at: indexPath) as? CustomCollectionCell else { return }
        // タップされた番号を追加
        self.selectedNumber.append(indexPath.row)
        print("\(self.selectedNumber)")
        
        if indexPath.row == collectNumber {
            // 王様が選択された場合
            let sb = UIStoryboard.init(name: "Kingdom", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "KingdomViewController") as! KingdomViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // 平民が選択された場合
            let sb = UIStoryboard.init(name: "Citizen", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "CitizenViewController") as! CitizenViewController
            if count == 0 {
                vc.number = number
            }
            vc.displayTimes = count
            vc.numberArray = self.numberArray
            count += 1
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
