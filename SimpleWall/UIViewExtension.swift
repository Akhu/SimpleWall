//
//  UIViewExtension.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 24/12/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func round(roundValue:CGFloat? = nil) {
        
        if roundValue != nil {
            layer.cornerRadius = roundValue!
        }else {
            layer.cornerRadius = self.layer.bounds.width/2
        }
        
        layer.masksToBounds = true
        self.clipsToBounds = true
    }
    
    open func configureDropShadow() {
        let layer = self.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.4
        layer.masksToBounds = false
        updateShadowPath()
    }
    
    private func updateShadowPath() {
        layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
    }
}
