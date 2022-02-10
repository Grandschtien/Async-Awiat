//
//  ColorInfoPresenter.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 10.02.2022.
//  
//

import Foundation

final class ColorInfoPresenter {
	weak var view: ColorInfoViewInput?
    weak var moduleOutput: ColorInfoModuleOutput?
    
	private let router: ColorInfoRouterInput
	private let interactor: ColorInfoInteractorInput
    
    init(router: ColorInfoRouterInput, interactor: ColorInfoInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    private func makeViewModel(photoViewModel: PhotoViewModel, hexColor: String, rgbColor: String) -> ColorInfoViewModel {
        let normalizedHexColor = "Hex color: " + hexColor
        let normalizedRGBColor = "RGB color: " + rgbColor
        return ColorInfoViewModel(id: photoViewModel.id,
                                  title: photoViewModel.title,
                                  url: photoViewModel.url,
                                  hexColor: normalizedHexColor,
                                  rgbColor: normalizedRGBColor)
    }
}

extension ColorInfoPresenter: ColorInfoModuleInput {
    func reciveColorInfo(hexColor: String, rgbColor: String, photoViewModels: PhotoViewModel) {
        let viewModel = makeViewModel(photoViewModel: photoViewModels,
                                      hexColor: hexColor,
                                      rgbColor: rgbColor)
        view?.updateViewWith(viewModel: viewModel)
    }
    
}

extension ColorInfoPresenter: ColorInfoViewOutput {
}

extension ColorInfoPresenter: ColorInfoInteractorOutput {
}
