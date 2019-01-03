//
//  AppDelegate.swift
//  Demo1
//
//  Created by 623971951 on 2019/1/3.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let asvc = AsyncDisplayKitDemoViewController()
        let asNav = UINavigationController(rootViewController: asvc)
        asNav.tabBarItem = UITabBarItem(title: "Texture", image: UIImage(named: "tempimg"), tag: 1)
        
        let ig = MixedDataViewController()
        let igNav = UINavigationController(rootViewController: ig)
        igNav.tabBarItem = UITabBarItem(title: "IGList", image: UIImage(named: "tempimg"), tag: 2)
        
        let tabindex = TabIndexViewController()
        let tabindexNav = UINavigationController(rootViewController: tabindex)
        tabindexNav.tabBarItem = UITabBarItem(title: "TabIndex", image: UIImage(named: "tempimg"), tag: 3)
        
        let home = HomeViewController()
        let homeNav = UINavigationController(rootViewController: home)
        homeNav.tabBarItem = UITabBarItem(title: "IGList+Texture", image: UIImage(named: "tempimg"), tag: 4)
        
        let tab = UITabBarController()
        tab.viewControllers = [asNav,igNav, tabindexNav, homeNav]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tab
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

