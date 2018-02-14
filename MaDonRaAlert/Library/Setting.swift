//
//  Setting.swift
//  AlertView
//
//  Created by Sakkaphong Luaengvilai on 18/12/2560 BE.
//  Copyright © 2560 MaDonRa. All rights reserved.
//

import UIKit

public enum Status {
    case Done , Error
    
    var Color : UIColor {
        switch self {
        case .Done :
            return UIColor.green
        case .Error :
            return UIColor.red
        }
    }
    
    var Image : UIImage? {
        guard let bundle = Bundle(identifier: "org.cocoapods.MaDonRaAlert") else { return nil }
        switch self {
        case .Done :
            return UIImage(named: "Done", in: bundle, compatibleWith: nil)
        case .Error :
            return nil
        }
    }
}

public let BlurColor = Blur.Dark.Color
public let BlurAlpha:CGFloat = 1.0

public let BackgroundColor:UIColor = UIColor.white

public var AlertSize:CGSize = CGSize(width: ScreenSize.SCREEN_WIDTH/2, height: ScreenSize.SCREEN_HEIGHT/5)

public var AnimationDropDown : Bool = true

