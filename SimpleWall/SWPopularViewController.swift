//
//  SWPopularViewController.swift
//  SimpleWall
//
//  Created by Anthony Da Cruz on 05/11/2016.
//  Copyright © 2016 Anthony Da Cruz. All rights reserved.
//

import UIKit

class SWPopularViewController: SWFlowViewController {
    
    

    override func viewDidLoad() {
        self.flowType = "popular"
        
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
