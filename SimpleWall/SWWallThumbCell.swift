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
    
    func configureView(_ wall: SWall){
        self.thumb.image = nil
        if let thumb = wall.imageWall?.smallSizeUrl {
            Nuke.loadImage(with: thumb, into: self.thumb)
        }
        
    }
}
