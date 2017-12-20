//
//  SettingColor.swift
//  AlertView
//
//  Created by Sakkaphong Luaengvilai on 18/12/2560 BE.
//  Copyright © 2560 MaDonRa. All rights reserved.
//

import UIKit

enum Blur {
    
    case Dark , Light
    
    var Color : UIBlurEffectStyle {
        switch self {
        case .Dark :
            return UIBlurEffectStyle.dark
        case .Light :
            return UIBlurEffectStyle.light
        }
    }
}

