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

class APIManager {
    
    let constantsPlist = PropertyListManager(file: "Constants")
    
    let apiURL:URL!
    let unsplashClientID:String!
    let unsplashSecret:String!
    
    var headers:HTTPHeaders = HTTPHeaders()
    
    init(){
        self.apiURL = URL(string: constantsPlist.getAPIUrl()!)
        self.unsplashClientID = constantsPlist.getUnsplashClientID()!
        self.unsplashSecret = constantsPlist.getUnsplashSecret()!
        
        self.headers = [
            "Authorization" : self.unsplashClientID,
        ]
        
    }
    
    func get(_ path: String,parameters:Parameters?, completion: @escaping (_ data:JSON?) -> Void ) {
        let url = URL(string: path, relativeTo: self.apiURL)
        var json:JSON?
        Alamofire.request(url!,parameters:parameters ,headers: self.headers)
            .responseJSON { response in
                switch response.result {
                case .success :
                    if let value = response.result.value {
                        json = JSON(value)
                        print(json)
                        completion(json)
                    }
                    break
                case .failure(let error):
                    print(error)
                    completion(nil)
                    break
                }
                
        }
        
    }
    
    
    
    func generateUrlForIdForSize(_ id: Int32, width: Int32, height: Int32) -> URL{
        if width == height {
            
            print(URL(string: String(width)+"?image="+String(id), relativeTo: self.apiURL)!.absoluteString)
            return URL(string: String(width)+"/"+String(height)+"?image="+String(id), relativeTo: self.apiURL)!
        }
        return URL(string: String(width)+"/"+String(height)+"?image="+String(id), relativeTo: self.apiURL)!
    }
    
}
