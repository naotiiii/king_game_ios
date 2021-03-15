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
    
    // 人数
    var number: Int = 0
    // コレクション数
    var collectionList: Int = 0
    // 王様番号
    var collectNumber: Int?
    // 選択済み番号
    var selectedNumber: [Int] = []
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
    
    /// 再読み込み
    private func reloadView() {
        // タイトルテキスト
        if self.number == self.selectedNumber.count {
            self.playTitleLabel.text = CommonWords.finishGameTitle()
        } else {
            self.playTitleLabel.text = CommonWords.headderTitle()
        }
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
