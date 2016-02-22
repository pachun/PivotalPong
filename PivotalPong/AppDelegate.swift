//
//  AppDelegate.swift
//  PivotalPong
//
//  Created by Pivotal on 2/19/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let recentGamesViewController = RecentGamesViewController(playerService:PlayerService())
        
        window?.rootViewController = recentGamesViewController
        window?.makeKeyAndVisible()
        
        return true
    }
}
