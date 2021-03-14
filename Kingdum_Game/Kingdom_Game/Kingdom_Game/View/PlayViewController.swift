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
    
    
    //MARK: - func
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }



}
