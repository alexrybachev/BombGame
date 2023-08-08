//
//  SceneDelegate.swift
//  SM8Bomb
//
//  Created by Сергей П on 07.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window=UIWindow(windowScene: windowScene)
        window?.rootViewController = MainViewController(nibName: "MainViewController", bundle: nil)
        window?.makeKeyAndVisible()
    }

}

