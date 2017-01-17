//
//  RootViewController.swift
//  StoryboardPaging
//
//  Created by Rommel Rico on 1/17/17.
//  Copyright © 2017 Rommel Rico. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var pageViewController: UIPageViewController?
    
    var contentPageRestorationIDs: [String] {
        if _contentPageRestorationIDs.count == 0 {
            _contentPageRestorationIDs = ["FirstVC", "SecondVC", "ThirdVC"]
        }
        
        return _contentPageRestorationIDs
    }
    var _contentPageRestorationIDs: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController
        self.pageViewController?.dataSource = self
        
        let startingViewController: UIViewController = self.viewControllerAtIndex(0)!
        
        self.pageViewController?.setViewControllers([startingViewController], direction: .forward, animated: false, completion: nil)
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview((self.pageViewController?.view)!)
        self.pageViewController?.didMove(toParentViewController: self)
    }
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        if index >= self.contentPageRestorationIDs.count {
            return nil
        }
    
        let contentViewController: BaseContentViewController = self.storyboard?.instantiateViewController(withIdentifier: _contentPageRestorationIDs[index]) as! BaseContentViewController
        contentViewController.rootViewController = self
    
        return contentViewController
    }
    
    func goToNextContentViewController() {
        let currentViewController = self.pageViewController!.viewControllers![0]
        let vcRestorationID = currentViewController.restorationIdentifier
        let index = self._contentPageRestorationIDs.index(of: vcRestorationID!)
        
        let nextViewController: UIViewController = self.viewControllerAtIndex(index! + 1)!
        
        self.pageViewController?.setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
    }
    
    func goToPreviousContentViewController() {
        let currentViewController = self.pageViewController!.viewControllers![0]
        let vcRestorationID = currentViewController.restorationIdentifier
        let index = self._contentPageRestorationIDs.index(of: vcRestorationID!)
        
        let previousViewController: UIViewController = self.viewControllerAtIndex(index! - 1)!
        
        self.pageViewController?.setViewControllers([previousViewController], direction: .forward, animated: true, completion: nil)
    }

}

extension RootViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self._contentPageRestorationIDs.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vcRestorationID = viewController.restorationIdentifier
        let index = self._contentPageRestorationIDs.index(of: vcRestorationID!)
        
        if index == self._contentPageRestorationIDs.count - 1 {
            return nil
        }
        
        return self.viewControllerAtIndex(index! + 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vcRestorationID = viewController.restorationIdentifier
        let index = self._contentPageRestorationIDs.index(of: vcRestorationID!)
        
        if index == 0 {
            return nil
        }
        
        return self.viewControllerAtIndex(index! - 1)
    }
    
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}
