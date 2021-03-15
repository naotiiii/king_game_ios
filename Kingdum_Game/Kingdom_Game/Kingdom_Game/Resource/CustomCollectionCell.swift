//
//  CustomCollectionCell.swift
//  Kingdom_Game
//
//  Created by naoto kojima on 2021/03/15.
//

import Foundation
import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    var textLabel: UILabel?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        textLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: frame.width, height: frame.height))
        textLabel?.textAlignment = .center
        textLabel?.tintColor = .systemBlue
        
        
        // Cellに追加
        self.contentView.addSubview(textLabel!)
    }
}
 
