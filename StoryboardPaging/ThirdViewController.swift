//
//  ThirdViewController.swift
//  StoryboardPaging
//
//  Created by Rommel Rico on 1/17/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit

class ThirdViewController: BaseContentViewController {

    @IBAction func page2Action(_ sender: Any) {
        self.rootViewController?.goToPreviousContentViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
