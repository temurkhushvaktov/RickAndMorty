//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Temur Khushvaktov on 23/01/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = CharactersConfigurator.configure()
        window?.makeKeyAndVisible()
        
        return true
    }

}

