//
//  UIViewControllerExtensions.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 11/10/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import Foundation
import UIKit

extension SWWallDetailViewController {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return wallImage
    }
}
