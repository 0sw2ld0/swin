//
//  AppDelegate.swift
//  Swin
//
//  Created by Oswaldo Leon on 05/31/2021.
//  Copyright (c) 2021 Oswaldo Leon. All rights reserved.
//

import UIKit
import Swin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Swin.modules(demoModule)
        Swin.start()
        
        nameFavoritePet = "Manchas"
        return true
    }

}
