//
//  ColorInfoProtocols.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 10.02.2022.
//  
//

import Foundation

protocol ColorInfoModuleInput {
    var moduleOutput: ColorInfoModuleOutput? { get }
    func reciveColorInfo(hexColor: String,
                         rgbColor: String,
                         photoViewModels: PhotoViewModel)
}

protocol ColorInfoModuleOutput: AnyObject {
}

protocol ColorInfoViewInput: AnyObject {
    func updateViewWith(viewModel: ColorInfoViewModel)
}

protocol ColorInfoViewOutput: AnyObject {
}

protocol ColorInfoInteractorInput: AnyObject {
}

protocol ColorInfoInteractorOutput: AnyObject {
}

protocol ColorInfoRouterInput: AnyObject {
}
