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
    
    var id:String?
    var username:String?
    var name:String?
    var portfolioUrl:URL?
    var profilImage:URL?
 
    
    convenience init(fromJSON: JSON) {
        self.init()
        self.id = fromJSON["id"].stringValue
        self.name = fromJSON["name"].stringValue
        self.username = fromJSON["username"].stringValue
        self.portfolioUrl = URL(string:fromJSON["portfolio_url"].stringValue)
        self.profilImage = URL(string: fromJSON["profile_image"]["small"].stringValue)
    }
}
//
//"user" : {
//    "id" : "Nzdf4NBI0yg",
//    "portfolio_url" : "https:\/\/www.facebook.com\/curiousbino\/",
//    "bio" : "I'm not yet a photographer, but a storyteller by photos.",
//    "location" : "Da Lat, Vietnam",
//    "first_name" : "Bino",
//    "total_likes" : 2,
//    "username" : "curiousbino",
//    "total_collections" : 0,
//    "profile_image" : {
//        "small" : "https:\/\/images.unsplash.com\/profile-1446472431299-bdd45bd2eb61?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32&s=1932a15f3d363242057c9588c61b48f6",
//        "large" : "https:\/\/images.unsplash.com\/profile-1446472431299-bdd45bd2eb61?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128&s=10250771cdafdfc89b93ef9f1453273b",
//        "medium" : "https:\/\/images.unsplash.com\/profile-1446472431299-bdd45bd2eb61?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64&s=4ded0c8e24a1709da0f811c9a1ade1bf"
//    },
//    "last_name" : "Storyteller",
//    "links" : {
//        "photos" : "https:\/\/api.unsplash.com\/users\/curiousbino\/photos",
//        "following" : "https:\/\/api.unsplash.com\/users\/curiousbino\/following",
//        "portfolio" : "https:\/\/api.unsplash.com\/users\/curiousbino\/portfolio",
//        "html" : "http:\/\/unsplash.com\/@curiousbino",
//        "followers" : "https:\/\/api.unsplash.com\/users\/curiousbino\/followers",
//        "self" : "https:\/\/api.unsplash.com\/users\/curiousbino",
//        "likes" : "https:\/\/api.unsplash.com\/users\/curiousbino\/likes"
//    },
//    "name" : "Bino Storyteller",
//    "total_photos" : 6
//}
