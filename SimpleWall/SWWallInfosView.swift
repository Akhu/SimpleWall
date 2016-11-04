//
//  THKRoundedView.swift
//  TachetKOA
//
//  Created by Anthony Da Cruz Pro on 08/03/2016.
//  Copyright © 2016 AboutGoods Company. All rights reserved.
//

import UIKit

@objc protocol SWWallInfosViewDelegate{
    @objc optional func SWWallInfosViewDelegateTouched()
}

//@IBDesignable
class SWWallInfosView: UIView {
    
    var view:UIView!
    
    @IBOutlet weak var delegate:NSObject?
    
    let nibName:String = "WallInfos"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
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
