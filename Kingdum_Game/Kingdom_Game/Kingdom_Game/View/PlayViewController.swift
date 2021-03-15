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
        self.numberListCollection.backgroundColor = .blue
        
        
        // 正解番号付与
        self.collectNumber = Int.random(in: 0...number)
        print("\(self.collectNumber)")
    }
}

extension PlayViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return number
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        for i in 0...number {
            if i == collectNumber {
                // 王様のViewに遷移
                
            } else {
                // 庶民の番号の画面に遷移
            }
        }
    }
}
