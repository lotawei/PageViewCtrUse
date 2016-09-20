//
//  AppDelegate.swift
//  PageViewCtrUse
//
//  Created by lotawei on 16/9/20.
//  Copyright © 2016年 lotawei. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor  = UIColor.white
        
        
        let    one =  ViewController()
        one.view.backgroundColor = UIColor.white
        
        window?.rootViewController =  UINavigationController(rootViewController: one)
       
        window?.makeKeyAndVisible()
        
        return true
    }



}

