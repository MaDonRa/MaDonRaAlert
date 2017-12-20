//
//  AlertViewDelegate.swift
//  AlertView
//
//  Created by Sakkaphong Luaengvilai on 18/12/2560 BE.
//  Copyright © 2560 MaDonRa. All rights reserved.
//

import UIKit

public protocol AlertViewDelegate {
    func Alert(View : UIView , Title: String , Text: String? , Image : UIImage? , Status : Status)
    func Dismiss()
}

public class AlertView: AlertViewDelegate {
    
    public init() {}
    
    private var Background : SetBackgroundSource = SetBackgroundSource(View: nil, Status: nil, Image: nil)
    
    private let CurrentView:UIView = UIView()
    
    public func Alert(View : UIView , Title: String , Text: String? = nil , Image : UIImage? = nil , Status : Status) {
        print("test")
        NotificationCenter.default.addObserver(self, selector: #selector(AlertView.Dismiss), name:NSNotification.Name(rawValue: "Dismiss"), object: nil)
        
        CurrentView.frame = View.frame
        CurrentView.backgroundColor = UIColor.clear
        View.addSubview(CurrentView)
        
        Background = SetBackgroundSource(View: CurrentView, Status: Status, Image: Image)
    }
    
    @objc public func Dismiss() {
        CurrentView.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

