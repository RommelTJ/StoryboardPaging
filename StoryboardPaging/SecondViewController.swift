//
//  SecondViewController.swift
//  StoryboardPaging
//
//  Created by Rommel Rico on 1/17/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit

class SecondViewController: BaseContentViewController {

    @IBAction func page1Action(_ sender: Any) {
        self.rootViewController?.goToPreviousContentViewController()
    }
    
    @IBAction func page3Action(_ sender: Any) {
        self.rootViewController?.goToNextContentViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
