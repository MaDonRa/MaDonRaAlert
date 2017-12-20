//
//  ScreenSize.swift
//  AlertView
//
//  Created by Sakkaphong Luaengvilai on 18/12/2560 BE.
//  Copyright © 2560 MaDonRa. All rights reserved.
//

import UIKit

struct ScreenSize
{
    
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    
    static let SCREEN_WIDTH_CENTER_X    = ScreenSize.SCREEN_WIDTH / 2
    static let SCREEN_HEIGHT_CENTER_Y   = ScreenSize.SCREEN_HEIGHT / 2
    
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    
}
