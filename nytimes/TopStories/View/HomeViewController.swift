//
//  HomeViewController.swift
//  nytimes
//
//  Created by user204729 on 11/23/21.
//

import UIKit

class HomeViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        title = "Top Stories"
    }

}

extension HomeViewController {
    
    func setup() {
        setupTabBar()
    }
    
    func setupTabBar() {
        let item1 = UITabBarItem()
        item1.title = "Stories"
        item1.image = UIImage(systemName: "book")
        let item2 = UITabBarItem()
        item2.title = "Bookmarks"
        item2.image = UIImage(systemName: "bookmark.fill")
        
        let topStoriesVC = TopStoriesViewController()
        let bookMarksVC = UIViewController()
        bookMarksVC.view.backgroundColor = .red

        topStoriesVC.tabBarItem = item1
        bookMarksVC.tabBarItem = item2
        
        viewControllers = [topStoriesVC, bookMarksVC]
        selectedIndex = 0
    }
}
