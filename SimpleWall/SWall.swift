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

class SWall {
    
    //let imageURL:NSURL
    let id:String!

    var imageWall:SWImage?
    
    var author:SWAuthor?
    
    init(id:String){
        self.id = id
    }
    
    convenience init(json: JSON) {
        self.init(id:json["id"].stringValue)
        self.imageWall = SWImage(fromJSON:json)
        self.author = SWAuthor(fromJSON:json["user"])
    }
    
    static func getPhotos(flowType orderBy:String = "latest", page:Int?, _ completion: @escaping (_ images: [SWall]?) -> Void) {
        let api = APIManager()
        
        var allImages:[SWall]?
        
        let parameters: Parameters = ["page": page, "per_page": 10, "order_by":orderBy]
        
        
        api.get("/photos",parameters:parameters, completion: { data in
            print(parameters)
                //print(data)
            if let listOfImageJSON = data {
                allImages = [SWall]()
                for oneImageJson in listOfImageJSON {
                    print(oneImageJson)
                    allImages?.append(SWall(json:oneImageJson.1))
                }
                completion(allImages)
            }else{
                completion(nil)
            }
            
        })
    }
    
    
//    func image () -> UIImage{
//        let api = APIManager()
//        let url = api.generateUrlForIdForSize(self.id, width: 100, height: 100)
//        api.get(url.absoluteString){_ in 
//            
//        }
//    }
    
}
