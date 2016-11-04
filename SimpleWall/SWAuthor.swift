//
//  User.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 10/10/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import Foundation
import SwiftyJSON

class SWAuthor {
    
    let id:String? = nil
    let username:String? = nil
    let name:String? = nil
    let portfolioUrl:String? = nil
    
    let profilImage:SWImage? = nil
 
    
    convenience init(fromJSON: JSON) {
        self.init()
    }
}
