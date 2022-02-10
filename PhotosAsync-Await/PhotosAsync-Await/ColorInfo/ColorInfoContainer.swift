//
//  ColorInfoContainer.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 10.02.2022.
//  
//

import UIKit

final class ColorInfoContainer {
    let input: ColorInfoModuleInput
	let viewController: UIViewController
	private(set) weak var router: ColorInfoRouterInput!

	static func assemble(with context: ColorInfoContext) -> ColorInfoContainer {
        let router = ColorInfoRouter()
        let interactor = ColorInfoInteractor()
        let presenter = ColorInfoPresenter(router: router, interactor: interactor)
		let viewController = ColorInfoViewController(output: presenter)

		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return ColorInfoContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: ColorInfoModuleInput, router: ColorInfoRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct ColorInfoContext {
	weak var moduleOutput: ColorInfoModuleOutput?
}
