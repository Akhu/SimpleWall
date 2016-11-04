//
//  SWWallDetailViewController.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 07/06/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import UIKit
import Nuke
import Alamofire

class SWWallDetailViewController: UIViewController, UIScrollViewDelegate {

    var wall:SWall?
    
    @IBOutlet weak var toolbarInfosButton: UIBarButtonItem!
    @IBOutlet weak var toolbarActionButton: UIBarButtonItem!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var wallImage: UIImageView!
    
    @IBOutlet weak var wallInfo: SWWallInfosView!
    
    @IBOutlet weak var loaderView: UIView!
    
    @IBOutlet weak var progressBarDownload: UIProgressView!
    
    @IBOutlet weak var progressLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageURL = self.wall?.imageWall?.regularSizeUrl {
            Nuke.loadImage(with: imageURL, into: self.wallImage)
        }
        
        self.loading(currentlyLoading: false)
        self.progressLabel.text = "0%"
        
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if let imageURL = self.wall?.imageWall?.fullSizeUrl {
//            Nuke.loadImage(with: imageURL, into: self.wallImage)
//        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.wallImage
    }
    
    @IBAction func actionButtonAction(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Action", message: "Save this image to your device", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let saveRawImageAction = UIAlertAction(title: "Save Raw Image", style: .default) { (action) in
            guard let urlToDownload = self.wall?.imageWall?.rawUrl else {
                return
            }
            
            self.downloadAndSaveImage(url: urlToDownload)
        }
        
        let saveAction = UIAlertAction(title: "Save HD image", style: UIAlertActionStyle.default) { (action) in
            
            guard let urlToDownload = self.wall?.imageWall?.fullSizeUrl else {
                return
            }
            
            self.downloadAndSaveImage(url: urlToDownload)
        }
        
        let defaultAction = UIAlertAction(title: "Done", style: UIAlertActionStyle.cancel) { (action) in
            //
        }
        
        alert.addAction(saveAction)
        alert.addAction(saveRawImageAction)
        alert.addAction(defaultAction)
        
        alert.view.tintColor = UIColor.skyBlue()
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func downloadAndSaveImage(url:URL){
        print(url.absoluteString)

        self.loading(currentlyLoading: true)
        
        Alamofire.request(url)
        .downloadProgress(closure: { progress in
            print(Int(progress.fractionCompleted.multiplied(by: 100).rounded(FloatingPointRoundingRule.up)))
            self.progressLabel.text = "\(Int(progress.fractionCompleted.multiplied(by: 100).rounded(FloatingPointRoundingRule.up)))%"
            self.progressBarDownload.progress = Float(progress.fractionCompleted)
        })
        .responseData { response in
            guard let data = response.result.value else {
                return
            }
            
            let image = UIImage(data: data)
            UIImageWriteToSavedPhotosAlbum(image!, self , #selector(self.imageHandler), nil)
            
        }
    }
    
    func imageHandler(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer) {
        self.loading(currentlyLoading: false)
        guard error == nil else {
            //Error saving image
            return
        }

    }
    
    func loading(currentlyLoading status:Bool){
        if status {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [UIViewAnimationOptions.transitionCurlUp], animations: {
                self.progressBarDownload.isHidden = false
                self.loaderView.isHidden = false
            }) { done in
                self.progressBarDownload.isHidden = false
                self.loaderView.isHidden = false
            }
        }else{
            UIView.animate(withDuration: 0.25, delay: 0.0, options: [UIViewAnimationOptions.curveEaseInOut], animations: {
                self.progressBarDownload.isHidden = true
                self.loaderView.isHidden = true
            }) { done in
                self.progressBarDownload.isHidden = true
                self.loaderView.isHidden = true
            }
        }
    }
    
    @IBAction func infosButtonAction(_ sender: UIBarButtonItem) {
        
    }
   
}
