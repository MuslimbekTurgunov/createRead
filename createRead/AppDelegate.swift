//
//  AppDelegate.swift
//  createRead
//
//  Created by Macbook on 02/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow()
        
        let loginVC = LoginVC.init(nibName: "LoginVC", bundle: nil)
        let mainVC = MainVC.init(nibName: "MainVC", bundle: nil)
        
        let name = UserDefaults.standard.string(forKey: "name")
        let surname = UserDefaults.standard.string(forKey: "surname")
        
        if name != nil && surname != nil {
            window?.rootViewController = mainVC
            window?.makeKeyAndVisible()
        } else {
            window?.rootViewController = loginVC
            window?.makeKeyAndVisible()
        }

        return true
    }



}

