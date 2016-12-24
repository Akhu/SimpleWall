//
//  THKRoundedView.swift
//  TachetKOA
//
//  Created by Anthony Da Cruz Pro on 08/03/2016.
//  Copyright © 2016 AboutGoods Company. All rights reserved.
//

import UIKit
import Nuke

@objc protocol SWWallInfosViewDelegate{
    @objc optional func SWWallInfosViewDelegateTouched()
}

//@IBDesignable
class SWWallInfosView: UIView {
    
    var view:UIView!
    
    @IBOutlet weak var photographerProfilPicture: UIImageView!
    
    @IBOutlet weak var delegate:NSObject?
    
    var author:SWAuthor? {
        didSet {
            if let author = self.author {
                
                if let profilImage = author.profilImage {
                    Nuke.loadImage(with: profilImage, into: self.photographerProfilPicture)
                }
                
                //name
            
            }
            
        }
    }
    
    let nibName:String = "WallInfos"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
        //self.photographerProfilPicture.round()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
        self.photographerProfilPicture.round()
        self.round(roundValue: 10)
    }
    
    
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var background: UIColor? {
        didSet {
            layer.backgroundColor = backgroundColor?.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            clipsToBounds = true
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        let shadowPath = UIBezierPath(rect: bounds)
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        layer.shadowOpacity = 0.5
        layer.shadowPath = shadowPath.cgPath
    }
    
    func xibSetup(){
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
}
