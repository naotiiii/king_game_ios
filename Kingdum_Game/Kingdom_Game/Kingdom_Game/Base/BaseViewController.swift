//
//  BaseViewController.swift
//  Kingdom_Game
//
//  Created by naoto kojima on 2021/02/25.
//

import Foundation
import UIKit
import GoogleMobileAds

/// BaseViewController
class BaseViewController: UIViewController {
    
    var bannerView: GADBannerView = GADBannerView()
    
    // 広告の有無
    var isRelease: Bool = false
    
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
    
    // バーナ広告の設定
    //
    // isRelease: Bool 本番かどうか
    public func setBottomBannerView() {
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.frame.origin = CGPoint(x: 0, y: self.view.frame.size.height - self.bannerView.frame.height)
        bannerView.frame.size = CGSize(width: self.view.frame.width, height: 50)
        bannerView.adUnitID = self.isRelease ? CommonWords.bannerID() : CommonWords.testBannerID()
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        self.view.addSubview(bannerView)
    }
}
