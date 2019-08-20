//
//  ExtensionClass.swift
//  MiniChallenge3
//
//  Created by Nanda Mochammad on 20/08/19.
//  Copyright © 2019 Batavia Hack Town. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController{
    func setNavigationBar(withTitle titleNavBar: String, destination: UIViewController) {
        // set navbar
        destination.navigationController?.navigationBar.topItem?.title = titleNavBar
    }
}

extension UITabBarController{
    func setTabBarItemContent(withTitle titleTabBar : String, andImage imageName : String = "journalLogoOn32", destination: UIViewController) {
        
        destination.tabBarItem = UITabBarItem(title: titleTabBar, image: UIImage(named: imageName), tag: 0)
        
    }
}
