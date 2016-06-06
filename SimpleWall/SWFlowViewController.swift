//
//  ViewController.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 06/06/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import UIKit

class SWFlowViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let reuseIdentifier = "imageCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

    var walls:[Wall] = [Wall]()
    
    var sizeForItem:CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Wall.getAllImages { (images) in
            if let walls = images {
                self.walls = walls
                self.collectionView?.reloadData()
            }
        }
        
        self.sizeForItem = ((self.collectionView?.bounds.width)! / 2)
        print(self.sizeForItem)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.sizeForItem!, self.sizeForItem!)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.walls.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.reuseIdentifier, forIndexPath: indexPath) as! SWWallThumbCell
        cell.configureView(self.walls[indexPath.row], size: Float(self.sizeForItem!))
        return cell
    }

}

