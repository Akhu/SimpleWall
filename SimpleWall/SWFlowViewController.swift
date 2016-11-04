//
//  ViewController.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 06/06/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import UIKit

//Todo : 
// Zoom to image (scroll view) : Done
// Save image to device
// Pagination : Done (todo : adding struct for page)
// refresh control
// search

class SWFlowViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    fileprivate let reuseIdentifier = "imageCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

    var walls:[SWall] = [SWall]()
    
    var page:Int = 1
    
    var sizeForItem:CGSize!
    
    var defaultHeightForItem:CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SWall.getRecentPhotos(page: page) { (images) in
            if let walls = images {
                self.walls = walls
                self.collectionView?.reloadData()
            }
        }
        
        self.updateLayout(viewSize: (self.collectionView?.bounds.size)!)

        //print(self.sizeForItem)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateLayout(viewSize size: CGSize) {
        if UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) {
            self.sizeForItem = CGSize(width: (size.width / 3), height: self.defaultHeightForItem)
        }else{
            self.sizeForItem = CGSize(width: (size.width / 2), height: self.defaultHeightForItem)
        }
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        //super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionViewLayout.invalidateLayout()
        //self.collectionView?.reloadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.updateLayout(viewSize: (self.collectionView?.bounds.size)!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "wallDetail" {
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "wallDetail" {
            if let indexSelected = self.collectionView?.indexPath(for: sender as! SWWallThumbCell) {
                
                let wallDetail = segue.destination as! SWWallDetailViewController
                wallDetail.wall = self.walls[(indexSelected as NSIndexPath).row]
            }
        }
    }
    
    // - MARK: Collection View Flow Delegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sizeForItem!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.walls.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as! SWWallThumbCell
        cell.configureView(self.walls[(indexPath as NSIndexPath).row])
        
        if indexPath.row == self.walls.count-1 {
            self.page = self.page+1
            SWall.getRecentPhotos(page: self.page, { (nextImages) in
                for imageToAppend in nextImages! {
                    self.walls.append(imageToAppend)
                }
                self.collectionView?.reloadData()
            })
        }
        
        return cell
    }

    
}

