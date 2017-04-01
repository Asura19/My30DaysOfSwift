//
//  AppDelegate.swift
//  AnimatedSplash
//
//  Created by Phoenix on 2017/4/1.
//  Copyright © 2017年 Wolkamo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, CAAnimationDelegate {

    var window: UIWindow?
    
    var mask: CALayer?
    var background: UIView?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        let controller = ViewController()
        self.window?.rootViewController = controller
        self.window!.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        self.window!.makeKeyAndVisible()
        
        let background = UIView()
        background.frame = UIScreen.main.bounds
        background.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        self.background = background
        self.window?.addSubview(background)
        
        let view = UIView()
        view.frame = UIScreen.main.bounds
        view.backgroundColor = UIColor.white
        background.addSubview(view)
        
        self.mask = CALayer()
        self.mask?.contents = UIImage(named: "twitter")?.cgImage
        self.mask?.contentsGravity = kCAGravityResizeAspectFill
        self.mask?.bounds = CGRect(x: 0, y: 0, width: 86, height: 70)
        self.mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.mask?.position = CGPoint(x: view.frame.size.width / 2.0, y: view.frame.size.height / 2.0)
        view.layer.mask = self.mask
        
        animation()
        
        
        return true
    }
    
    func animation() {
        let keyFrameAniamtion = CAKeyframeAnimation(keyPath: "bounds")
        keyFrameAniamtion.delegate = self
        keyFrameAniamtion.duration = 0.6
        keyFrameAniamtion.beginTime = CACurrentMediaTime() + 1
        keyFrameAniamtion.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let initalBounds = NSValue(cgRect: self.mask!.bounds)
        let secondBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 77.5, height: 63))
        let finalBounds = NSValue(cgRect: CGRect(x: 0, y: 0, width: 3075, height: 2500))
        keyFrameAniamtion.values = [initalBounds, secondBounds, finalBounds]
        keyFrameAniamtion.keyTimes = [0, 0.5, 1]
        self.mask?.add(keyFrameAniamtion, forKey: "bounds")

        UIView.animate(withDuration: 0.2, delay: 1.4, options: UIViewAnimationOptions.curveLinear, animations: {
            self.background?.alpha = 0
        }) { (_) in
            
        }
        // 实现得不太好啊....有待改善
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.background?.removeFromSuperview()
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

