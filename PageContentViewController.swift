//
//  PageContentViewController.swift
//  Music-Practice-App
//
//  Created by Justin Schwaitzberg on 4/18/17.
//  Copyright © 2017 Milton Jazz. All rights reserved.
//

import Foundation
import UIKit


class PageContentViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController(name: "PageOne"),
                self.newViewController(name: "PageTwo"),
                self.newViewController(name: "PageThree")]
    }()
    
    private func newViewController(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: name)
    }
    
    
    
    
}


extension PageContentViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
}


