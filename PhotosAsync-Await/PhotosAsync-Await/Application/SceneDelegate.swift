//
//  SceneDelegate.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let photosContext = PhotosContext(moduleOutput: nil)
        let photosContainer = PhotosContainer.assemble(with: photosContext)
        let navigatioNController = UINavigationController(
            rootViewController: photosContainer.viewController
        )
        window?.overrideUserInterfaceStyle = .light
        window?.rootViewController = navigatioNController
        window?.makeKeyAndVisible()
    }

}

