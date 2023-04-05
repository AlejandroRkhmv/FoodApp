//
//  SceneDelegate.swift
//  FoodApp
//
//  Created by Александр Рахимов on 04.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let builder = Builder()
        // MARK: - viewControllers
        let menuViewController = builder.createMenuViewController()
        let contactsViewController = ContactsViewController()
        let profileViewController = ProfileViewController()
        let cartViewController = CartViewController()
        
        // MARK: - navigationControllers
        let menuNavigationController = UINavigationController(rootViewController: menuViewController)
        let contactsNavigationController = UINavigationController(rootViewController: contactsViewController)
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        let cartNavigationController = UINavigationController(rootViewController: cartViewController)
        
        // MARK: - create and configure tabBarController
        let tabBarViewController = UITabBarController()
        tabBarViewController.setViewControllers([menuNavigationController, contactsNavigationController, profileNavigationController, cartNavigationController], animated: true)
        
        tabBarViewController.tabBar.unselectedItemTintColor = UIColor(named: "tabBarUnselected")
        tabBarViewController.tabBar.tintColor = UIColor(named: "tabBarSelected")
        tabBarViewController.tabBar.backgroundColor = .white
        tabBarViewController.tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        tabBarViewController.tabBar.layer.shadowColor = UIColor(named: "shadowTabBar")?.cgColor
        tabBarViewController.tabBar.layer.shadowRadius = 10
        tabBarViewController.tabBar.layer.shadowOpacity = 1
        
        contactsViewController.view.reloadInputViews()
        profileViewController.view.reloadInputViews()
        cartViewController.view.reloadInputViews()
        
        
        self.window?.rootViewController = tabBarViewController
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.coreDataStack.saveContext()
    }


}

