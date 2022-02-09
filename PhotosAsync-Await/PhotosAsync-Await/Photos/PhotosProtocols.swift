//
//  PhotosProtocols.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//  
//

import Foundation

protocol PhotosModuleInput {
	var moduleOutput: PhotosModuleOutput? { get }
}

protocol PhotosModuleOutput: class {
}

protocol PhotosViewInput: class {
}

protocol PhotosViewOutput: class {
}

protocol PhotosInteractorInput: class {
}

protocol PhotosInteractorOutput: class {
}

protocol PhotosRouterInput: class {
}
