//
//  PropertyListReader.swift
//  TachetKOA
//
//  Created by Anthony Da Cruz Pro on 03/03/2016.
//  Copyright © 2016 AboutGoods Company. All rights reserved.
//

import Foundation
import UIKit

class PropertyListManager {
    
    internal var plistDictionnary: NSDictionary?
    
    init(file: String) {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "plist"){
            plistDictionnary = NSDictionary(contentsOfFile: path);
        }
    }
        
    internal func getAPIUrl() -> String?{
        if let dict = self.plistDictionnary {
            if let appID = dict.valueForKey("api"){
                return appID as? String
            }
            return nil
        }
        return nil
    }
}
