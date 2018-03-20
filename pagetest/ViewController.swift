//
//  ViewController.swift
//  pagetest
//
//  Created by Ankit Goel on 1/22/18.
//  Copyright © 2018 Ankit Goel. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController {

    var pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        self.setViewControllers([self.getViewController(index: 0)], direction: .forward, animated: false, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configurePageControl()
    }

    func configurePageControl() {
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }

}

extension ViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent = viewController as! PageContentViewController
        let pageIndex = pageContent.pageIndex
        if pageIndex == 0 || pageIndex == NSNotFound {
            return nil
        }
        return self.getViewController(index: pageIndex - 1)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent = viewController as! PageContentViewController
        let pageIndex = pageContent.pageIndex
        if pageIndex == 2 || pageIndex == NSNotFound {
            return nil
        }
        return self.getViewController(index: pageIndex + 1)
    }

    func getViewController(index: Int) -> PageContentViewController {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PageContentViewController") as! PageContentViewController
        vc.pageIndex = index
        return vc
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
}

extension ViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let vc = self.viewControllers![0] as! PageContentViewController
        self.pageControl.currentPage = vc.pageIndex
    }
}
