//
//  AppDelegate.swift
//  3DTouch
//
//  Created by Phoenix on 2017/4/22.
//  Copyright © 2017年 Phoenix. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var isFirstLaunch: Bool = false
    
    fileprivate enum AppShortcut: String {
     
        case NewProject
        case List
        case Weigh
        
        init?(fullType: String) {
            guard let lastString = fullType.components(separatedBy: ".").last else {
                return nil
            }
            self.init(rawValue: lastString)
        }
    }

    var launchedShortcutItem: UIApplicationShortcutItem?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] {
            launchedShortcutItem = shortcutItem as? UIApplicationShortcutItem
        }
        
        isFirstLaunch = true
        
        if let shortcut = launchedShortcutItem {
            _ = handleShortcutItem(shortcut)
            launchedShortcutItem = nil
        }
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handleAction = handleShortcutItem(shortcutItem)
        completionHandler(handleAction)
    }
    
    func handleShortcutItem(_ shortcutItem: UIApplicationShortcutItem) -> Bool {
        
        if isFirstLaunch {
            isFirstLaunch = false
        }
        
        var isHandled = false
        
        let shortcutType = AppShortcut(fullType: shortcutItem.type)
        
        guard shortcutType != nil else {
            return false
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controller = UIViewController()
        
        switch shortcutType! {
        case .NewProject:
            controller = storyboard.instantiateViewController(withIdentifier: "NewProjectViewController") as! NewProjectViewController
            isHandled = true
            break
        case .List:
            controller = storyboard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
            isHandled = true
            break
        case .Weigh:
            controller = storyboard.instantiateViewController(withIdentifier: "WeighViewController") as! WeighViewController
            isHandled = true
            break
        }
        if !isFirstLaunch {
            window?.rootViewController?.dismiss(animated: false, completion: nil)
        }
        
        window?.rootViewController?.present(controller, animated: true, completion: nil)
        
        return isHandled
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

    

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

