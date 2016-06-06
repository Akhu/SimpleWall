//
//  Wall.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 06/06/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import ReachabilitySwift

class Wall {
    
    //let imageURL:NSURL
    let id:Int32
    
    
    init(id:Int32){
        self.id = id
    }
    
//    convenience init(){
//        
//    }
    
    static func getAllImages(completion: (images: [Wall]?) -> Void) {
        let api = APIManager()
        var allImages:[Wall]?
        api.get("/list", completion: { data in
            if let listOfImageRawJSON = data {
                allImages = [Wall]()
                for oneImageJSON in listOfImageRawJSON {
                    allImages?.append(Wall(id: oneImageJSON.1["id"].int32Value))
                }
                completion(images: allImages)
            }else{
                completion(images: nil)
            }
            
        })
    }
}