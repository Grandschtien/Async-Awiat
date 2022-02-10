//
//  PhotosRouter.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//  
//

import UIKit

final class PhotosRouter {
    var viewController: UIViewController?
}

extension PhotosRouter: PhotosRouterInput {
    func addColorInfoToColorInfoScreen(hexColor: String,
                                       rgbColor: String,
                                       photoViewModels: PhotoViewModel) {
        let colorInfoContext = ColorInfoContext(moduleOutput: nil)
        let colorInfoContainer = ColorInfoContainer.assemble(with: colorInfoContext)
        colorInfoContainer.input.reciveColorInfo(hexColor: hexColor,
                                                 rgbColor: rgbColor,
                                                 photoViewModels: photoViewModels)
        viewController?.navigationController?.pushViewController(colorInfoContainer.viewController,
                                                                 animated: true)
    }
}
