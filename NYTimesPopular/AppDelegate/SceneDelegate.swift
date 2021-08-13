//
//  SceneDelegate.swift
//  NYTimesPopular
//
//  Created by Waris on 12/08/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        guard
          let splitViewController = window?.rootViewController as? UISplitViewController,
          let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
          let masterViewController = leftNavController.viewControllers.first as? MasterViewController,
          let detailViewController = (splitViewController.viewControllers.last as? UINavigationController)?.topViewController as? DetailViewController
          else { fatalError() }

        masterViewController.getPopularFeed(1)
        masterViewController.delegate = detailViewController
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
    }

    func sceneDidDisconnect(_ scene: UIScene) { }

    func sceneDidBecomeActive(_ scene: UIScene) { }

    func sceneWillResignActive(_ scene: UIScene) { }

    func sceneWillEnterForeground(_ scene: UIScene) { }

    func sceneDidEnterBackground(_ scene: UIScene) { }
}

