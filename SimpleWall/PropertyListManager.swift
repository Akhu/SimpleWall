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
        if let path = Bundle.main.path(forResource: file, ofType: "plist"){
            plistDictionnary = NSDictionary(contentsOfFile: path);
        }
    }
    
    func getUnsplashClientID() -> String? {
        if let dict = self.plistDictionnary {
            if let unsplashDict = dict.value(forKey: "unsplash"){
                if let unsplashClientID = (unsplashDict as AnyObject).value(forKey: "client-ID"){
                    return unsplashClientID as? String
                }
            }
            return nil
        }
        return nil
    }
    
    func getUnsplashSecret() -> String? {
        if let dict = self.plistDictionnary {
            if let unsplashDict = dict.value(forKey: "unsplash"){
                if let unsplashSecret = (unsplashDict as AnyObject).value(forKey: "secret"){
                    return unsplashSecret as? String
                }
            }
            return nil
        }
        return nil
    }
    
    internal func getAPIUrl() -> String?{
        if let dict = self.plistDictionnary {
            if let appID = dict.value(forKey: "api"){
                return appID as? String
            }
            return nil
        }
        return nil
    }
}
