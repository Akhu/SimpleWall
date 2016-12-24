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
}
