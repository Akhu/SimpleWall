//
//  APIManager.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 06/06/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ReachabilitySwift

class APIManager {
 
    let constantsPlist = PropertyListManager(file: "Constants")
    
    let apiURL:NSURL!
    
    init(){
        self.apiURL = NSURL(string: constantsPlist.getAPIUrl()!)
    }
    
    func get(path: String,completion: (data:JSON?) -> Void ) {
        let url = NSURL(string: path, relativeToURL: self.apiURL)
        var json:JSON?
        //print(url?.absoluteString)
        Alamofire.request(.GET, url!).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    json = JSON(value)
                    completion(data: json)
                }
            case .Failure(let error):
                print(error)
                completion(data: nil)
            }
        }
        
    }
    
    func generateUrlForIdForSize(id: Int32, width: Int32, height: Int32) -> NSURL{
        return NSURL(string: String(width)+"/"+String(height)+"?image="+String(id), relativeToURL: self.apiURL)!
    }

}