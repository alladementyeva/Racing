//
//  GameButton.swift
//  Race
//
//  Created by user on 13.10.2022.
//

import UIKit

class GameButton: UIButton {
    //var mainColor : UIColor = UIColor(named: "Yellow")!
    var mainColor : UIColor!
    
    /*
    convenience init(type: UIButton.ButtonType) {
        self.init(type: type)
        clipsToBounds = true
    }
    */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        clipsToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
    }
    
    override var clipsToBounds: Bool {
        didSet {
            layer.cornerRadius = 10
        }
    }
    
    func enable(_ enableFlag: Bool)
    {
        if mainColor == nil {
            mainColor = self.backgroundColor!
        }
        
        self.isEnabled = enableFlag
        
        self.backgroundColor = enableFlag ? mainColor : UIColor(named: "Grey")
    }
}

