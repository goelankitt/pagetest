//
//  PageContentViewController.swift
//  pagetest
//
//  Created by Ankit Goel on 1/22/18.
//  Copyright © 2018 Ankit Goel. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {
    var pageIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        if pageIndex == 0 {
            self.view.backgroundColor = UIColor.green
        } else if pageIndex == 1 {
            self.view.backgroundColor = UIColor.blue
        } else {
            self.view.backgroundColor = UIColor.orange
        }
    }
}
