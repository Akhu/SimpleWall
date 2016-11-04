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
    
    var imageToSave:UIImageView?
    
    @IBOutlet weak var progressBarDownload: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageURL = self.wall?.imageWall?.regularSizeUrl {
            Nuke.loadImage(with: imageURL, into: self.wallImage)
        }
        self.imageToSave = UIImageView()
        
        print(self.wall?.imageWall?.smallSizeUrl)
        
//        Alamofire.download(URL(string: "https://images.unsplash.com/photo-1477290459437-16a3a5308623?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max&s=50a860e069beb7ac070599d4e2f33bf2")!)
//            .downloadProgress(closure: { (progress) in
//                print("Download Progress: \(progress.fractionCompleted*100.rounded())")
//            })
//            .response { response in
//                print(response.result)
//                
//                if let data = response.result.value {
//                    self.imageToSave?.image = UIImage(data: data)
//                    UIImageWriteToSavedPhotosAlbum(self.wallImage.image!, self, Selector(("imageSavingCompletionHandler")), nil)
//                }
//        }
        
        self.progressBarDownload.isHidden = true
        
        
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
        
        
        let alert = UIAlertController(title: "Action", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let saveRawImageAction = UIAlertAction(title: "Save Original sized Image (could take long time)", style: .default) { (action) in
            guard let urlToDownload = self.wall?.imageWall?.rawUrl else {
                return
            }
            
            self.downloadAndSaveImage(url: urlToDownload)
        }
        
        let saveAction = UIAlertAction(title: "Save HD sized image", style: UIAlertActionStyle.default) { (action) in
            
            guard let urlToDownload = self.wall?.imageWall?.smallSizeUrl else {
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
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [UIViewAnimationOptions.curveEaseIn], animations: {
                self.progressBarDownload.isHidden = false
            }) { done in
                self.progressBarDownload.isHidden = false
            }
        
        
        Alamofire.request(url)
        .downloadProgress(closure: { progress in
            print(Float(progress.fractionCompleted.multiplied(by: 100).rounded()))
            self.progressBarDownload.progress = Float(progress.fractionCompleted)
        })
        .responseData { response in
            guard let data = response.result.value else {
                return
            }
            
            let image = UIImage(data: data)
            UIImageWriteToSavedPhotosAlbum(image!, self , #selector(self.imageHandler), nil)
            
        }
        
//        Alamofire.download(url)
//            .downloadProgress(closure: { (progress) in
//                print("Download Progress: \(progress.fractionCompleted*100.rounded())")
//            })
//            .responseData { response in
//            print(response.result.value)
//            if let data = response.result.value {
//                let image = UIImage(data: data)
//                UIImageWriteToSavedPhotosAlbum(image!, self, Selector(("imageSavingCompletionHandler")), nil)
//            }
//        }
//        Nuke.loadImage(with: url, into: self.wallImage!, handler: { (response, something) in
//            print(response)
//            print(something)
//            UIImageWriteToSavedPhotosAlbum(self.wallImage.image!, self , #selector(self.imageHandler), nil)
//        })
    }
    
    func imageHandler(image: UIImage, didFinishSavingWithError error: NSError?, contextInfo:UnsafeRawPointer) {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [UIViewAnimationOptions.curveEaseIn], animations: {
                self.progressBarDownload.isHidden = true
            }) { done in
                self.progressBarDownload.isHidden = true
            }
        guard error == nil else {
            //Error saving image
            return
        }

    }
    
    @IBAction func infosButtonAction(_ sender: UIBarButtonItem) {
        
    }
   
}
