//
//  SWWallThumbCell.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 07/06/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import UIKit
import Nuke

class SWWallThumbCell: UICollectionViewCell {
    
    @IBOutlet weak var thumb: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureView(wall: Wall, size: Float){
         let api = APIManager()
        self.thumb.image = nil
        self.thumb.nk_setImageWith(api.generateUrlForIdForSize(wall.id, width: Int32(size), height: Int32(size)))
    }
}
