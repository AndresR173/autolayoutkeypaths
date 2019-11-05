//
//  AppDelegate.swift
//  AutoLayoutKeyPaths
//
//  Created by Andres Rojas on 5/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window : UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()

        return true
    }

}

