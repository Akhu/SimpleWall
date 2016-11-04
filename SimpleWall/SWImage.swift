//
//  Image.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 10/10/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import Foundation
import SwiftyJSON

class SWImage {
    
    var rawUrl:URL? = nil
    var fullSizeUrl:URL? = nil
    var regularSizeUrl:URL? = nil
    var smallSizeUrl:URL? = nil
    var thumbSizeUrl:URL? = nil
    
    var downloadUrl:URL? = nil
    
    convenience init(fromJSON: JSON) {
        self.init()
        if let urls = fromJSON["urls"].dictionary {
            self.rawUrl = URL(string: (urls["raw"]?.stringValue)!)
            self.fullSizeUrl = URL(string: (urls["full"]?.stringValue)!)
            self.regularSizeUrl = URL(string: (urls["regular"]?.stringValue)!)
            self.smallSizeUrl = URL(string: (urls["small"]?.stringValue)!)
            self.thumbSizeUrl = URL(string: (urls["thumb"]?.stringValue)!)
            
        }
        
        if let links = fromJSON["links"].dictionary {
            self.downloadUrl = URL(string: (links["download_location"]?.stringValue)!)
        }
        
    }

}
