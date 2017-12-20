//
//  AlertViewDatadatasource.swift
//  AlertView
//
//  Created by Sakkaphong Luaengvilai on 18/12/2560 BE.
//  Copyright © 2560 MaDonRa. All rights reserved.
//

import UIKit

class SetBackgroundSource : NSObject {
    
    private weak var CurrentView : UIView!
    private var Status : Status!
    private let BackgroundView : UIView = UIView()
    private var SetImage:UIImage?
    
    init(View : UIView? , Status : Status? , Image : UIImage? ) {

        self.Status = Status
        self.CurrentView = View
        self.SetImage = Image
        
        super.init()
        guard (View != nil) , (Status != nil) else { return }
        
        self.CreateBackground()
        self.CreateView()
        self.CreateHeader()
        self.CreateSubHeader()
        self.CreateImageInSubHeader()
    }
    
    private func CreateBackground() {

        let Blur = UIVisualEffectView(effect: UIBlurEffect(style: BlurColor))
        Blur.frame = CurrentView.frame
        Blur.alpha = BlurAlpha
        Blur.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SetBackgroundSource.Close))
        Blur.isUserInteractionEnabled = true
        Blur.addGestureRecognizer(Tap)

        CurrentView.addSubview(Blur)

    }
    
    @objc private func Close() {
        NotificationCenter.default.post(name: Notification.Name(rawValue: "Dismiss"), object: nil)
    }
    
    private func CreateView() {
        
        let BackgroundFrame : FrameAndCenterUI = FrameAndCenterUI.init(Size : AlertSize)

        BackgroundView.frame = CGRect(x: BackgroundFrame.X , y: -BackgroundFrame.Height , width: BackgroundFrame.Width , height: BackgroundFrame.Height)
        BackgroundView.backgroundColor = BackgroundColor
        BackgroundView.alpha = 0.5
        BackgroundView.layer.masksToBounds = true
        BackgroundView.layer.cornerRadius = BackgroundView.bounds.size.height / 20.0
        CurrentView.addSubview(BackgroundView)

        defer {
            MoveAnimation(View: BackgroundView, To: BackgroundFrame.Y + BackgroundFrame.Height)
        }

    }
    
    private func CreateHeader() {

        let HeaderFrame:FrameAndCenterUI = FrameAndCenterUI.init(Size: CGSize(width: BackgroundView.frame.height/2.3, height: BackgroundView.frame.height/2.3))
  
        let HeaderView : UIView = UIView()
        HeaderView.frame = CGRect(x: HeaderFrame.X , y: -(BackgroundView.frame.size.height+HeaderFrame.Height), width: HeaderFrame.Width , height: HeaderFrame.Height)
        HeaderView.backgroundColor = UIColor.white
        HeaderView.alpha = 0
        HeaderView.layer.masksToBounds = true
        HeaderView.layer.cornerRadius = HeaderView.bounds.size.height / 2.0
        CurrentView.addSubview(HeaderView)

        defer {
            MoveAnimation(View: HeaderView, To: (HeaderFrame.Y - BackgroundView.frame.height/2) + BackgroundView.frame.size.height+HeaderFrame.Height)
        }

    }
    
    private func CreateSubHeader() {

        let SubHeaderFrame:FrameAndCenterUI = FrameAndCenterUI.init(Size: CGSize(width: BackgroundView.frame.height/2.7, height: BackgroundView.frame.height/2.7))
        
        let SubHeaderView : UIView = UIView()
        SubHeaderView.frame = CGRect(x: SubHeaderFrame.X , y: -(BackgroundView.frame.size.height+SubHeaderFrame.Height), width: SubHeaderFrame.Width , height: SubHeaderFrame.Height)
        SubHeaderView.backgroundColor = Status.Color
        SubHeaderView.alpha = 0
        SubHeaderView.layer.masksToBounds = true
        SubHeaderView.layer.cornerRadius = SubHeaderView.bounds.size.height / 2.0
        CurrentView.addSubview(SubHeaderView)
        
        defer {
            MoveAnimation(View: SubHeaderView, To: (SubHeaderFrame.Y - BackgroundView.frame.height/2) + BackgroundView.frame.size.height+SubHeaderFrame.Height)
        }
        
    }
    
    private func CreateImageInSubHeader() {

        let ImageSubHeaderFrame:FrameAndCenterUI = FrameAndCenterUI.init(Size: CGSize(width: BackgroundView.frame.height/3, height: BackgroundView.frame.height/3))
        
        let ImageSubHeaderView : UIImageView = UIImageView()
        ImageSubHeaderView.frame = CGRect(x: ImageSubHeaderFrame.X , y: -(BackgroundView.frame.size.height+ImageSubHeaderFrame.Height), width: ImageSubHeaderFrame.Width , height: ImageSubHeaderFrame.Height)
       
        ImageSubHeaderView.image = SetImage ?? Status.Image
        ImageSubHeaderView.alpha = 0
        CurrentView.addSubview(ImageSubHeaderView)
        
        defer {
            MoveAnimation(View: ImageSubHeaderView, To: (ImageSubHeaderFrame.Y - BackgroundView.frame.height/2) + BackgroundView.frame.size.height+ImageSubHeaderFrame.Height)
        }

    }
    
    private func MoveAnimation(View : UIView , To : CGFloat) {
        View.frame.origin.y += AnimationDropDown ? 0 : To

        UIView.animate(withDuration: AnimationDropDown ? 0.3 : 0.5, animations: {

            View.alpha = 1.0
            
            guard AnimationDropDown else { return }
            
            View.frame.origin.y += To

        }) { (Done) in
            guard AnimationDropDown,self.Status == .Error else { return }
            let animation = CABasicAnimation(keyPath: "position")
            animation.duration = 0.06
            animation.repeatCount = 3
            animation.autoreverses = true
            animation.fromValue = CGPoint(x: View.center.x , y: View.center.y - 10)
            animation.toValue = CGPoint(x: View.center.x , y: View.center.y + 10)
            View.layer.add(animation, forKey: "position")
        }
    }
}
