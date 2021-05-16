//
//  AppDelegate.swift
//  MVVMDebut
//
//  Created by 三浦　登哉 on 2021/05/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let callbackNav = UINavigationController(rootViewController: CallbackViewController())
        self.window?.rootViewController = callbackNav
        self.window?.makeKeyAndVisible()
        return true
    }
}

