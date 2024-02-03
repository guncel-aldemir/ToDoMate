//
//  GFTabBarController.swift
//  ToDoMate
//
//  Created by guncel on 3.02.2024.
//

import UIKit
import SwiftUI

final class GFTabBarController:UITabBarController{
    
    override func viewDidLoad() {
        createTabBar() 
    }
    
    fileprivate func createNC(viewController:UIViewController, title:String, styleIcon:String,tag:Int) -> UINavigationController{
        let createVC = viewController
        createVC.title = title
        createVC.tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: styleIcon) , tag: tag)
        createVC.tabBarItem.standardAppearance?.backgroundColor = .systemBackground
        return UINavigationController(rootViewController: createVC)
    }
    fileprivate func createTabBar() {
        UITabBar.appearance().tintColor = .label
        viewControllers = [
            createNC(viewController: LoginViewController(loginViewModel: LoginViewModel()), title: "Home", styleIcon:"house.fill", tag: 0),
            createNC(viewController: ProfileViewController(), title: "Profile", styleIcon: "person.circle.fill", tag: 1)
        ]
        tabBar.backgroundColor = .systemBackground
    }
}

