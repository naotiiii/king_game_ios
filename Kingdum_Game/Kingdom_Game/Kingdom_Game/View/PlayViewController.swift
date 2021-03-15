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
    var collectionList: Int = 0
    var collectNumber: Int?
    
    //MARK: - func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    /// 初期設定
    private func initView() {
        // タイトルテキスト設定
        self.playTitleLabel.text = CommonWords.ok()
        self.playTitleLabel.textColor = .black
        self.playTitleLabel.backgroundColor = .white
        
        self.numberListCollection.backgroundColor = .white
        self.numberListCollection.delegate = self
        self.numberListCollection.dataSource = self
        self.collectionList = number - 1
        self.collctionLayout()
        print("\(self.collectionList)")
        
        // 正解番号付与
        self.collectNumber = Int.random(in: 0...self.collectionList)
        print("\(self.collectNumber)")
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
        return collectionList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        cell.contentView.backgroundColor = .black
        
            
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == collectNumber {
            // 王様が選択された場合
            let sb = UIStoryboard.init(name: "Kingdom", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "KingdomViewController") as! KingdomViewController
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            // 平民が選択された場合
            let sb = UIStoryboard.init(name: "Citizen", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "CitizenViewController") as! CitizenViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
