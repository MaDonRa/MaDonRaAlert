//
//  FrameAndCenterUI.swift
//  AlertView
//
//  Created by Sakkaphong Luaengvilai on 18/12/2560 BE.
//  Copyright © 2560 MaDonRa. All rights reserved.
//

import UIKit

struct FrameAndCenterUI {
    
    var Width : CGFloat
    var Height : CGFloat
    
    var X : CGFloat
    var Y : CGFloat
    
    init(Size : CGSize) {
        
        self.Width = Size.width
        self.Height = Size.height
        
        self.X = ScreenSize.SCREEN_WIDTH_CENTER_X - Size.width/2
        self.Y = ScreenSize.SCREEN_HEIGHT_CENTER_Y - Size.height/2
    }
}
