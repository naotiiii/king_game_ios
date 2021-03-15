//
//  CommonWords.swift
//  Kingdom_Game
//
//  Created by naoto kojima on 2021/02/25.
//

import Foundation

/// CommonWords
class CommonWords: NSObject {
    // 共通
    public class func ok() -> String { return "OK" }
    public class func close() -> String { return "CLOSE"}
    public class func empty() -> String { return "" }
    
    // MainView
    public class func mainViewNavigationTitle() -> String { return "Kingdom Gama" }
    public class func mainViewLabelTitle() -> String { return "Kingdom Game\n~王様ゲーム~" }
    public class func explainLabelText() -> String { return "Plese enter the number of peolple!\n~人数を入れてね！~"}
    public class func explainNumber() -> String { return "Plese enter the number of peolple!\n入力フォームに人数を入れてね!" }
    public class func startBtnTitle() -> String { return "START\n開始" }
    
    // PlayView
    public class func headderTitle() -> String { return "Please select one\nひとつ選択してくだい。" }
    public class func finishGameTitle() -> String { return "Who is the King??\n王様だ〜れだ??" }
    public class func collectionTitle() -> String { return "King\nor\nCitizen" }
    public class func selectedCellTitle() -> String { return "Selected\n選択済" }
}
