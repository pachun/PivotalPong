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
     
        #if DEBUG
            let env = NSProcessInfo.processInfo().environment
            if env["resetData"] != nil {
                resetData()
            }
        #endif
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let recentGamesViewController = RecentGamesViewController(playerService:PlayerService())
        window?.rootViewController = recentGamesViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    #if DEBUG
    func resetData() {
        let documentsDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        
        let fileManager = NSFileManager.defaultManager()
        
        let dataFile = (documentsDir as NSString).stringByAppendingPathComponent("winners.obj")
        
        if fileManager.fileExistsAtPath(dataFile) {
            print("Removing data file at: \(dataFile)")
            do {
                try fileManager.removeItemAtPath(dataFile)
            } catch {
                print("Yo it died: \(error)")
            }
        }
    }
    #endif
}
