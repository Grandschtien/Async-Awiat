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

protocol PhotosModuleOutput: AnyObject {
}

protocol PhotosViewInput: AnyObject {
    func updateView(with viewModels: [PhotoViewModel])
    func updateView(with errorDescription: String)
}

protocol PhotosViewOutput: AnyObject {
    func viewDidLoad()
    func loadNextPage(from start: Int, limit: Int)
    func getColorInfo(hexColor: String,
                      rgbColor: String,
                      photoViewModels: PhotoViewModel)
}

protocol PhotosInteractorInput: AnyObject {
    func loadFirstPage()
    func loadNextPage(from start: Int, limit: Int)
}

protocol PhotosInteractorOutput: AnyObject {
    func didLoadPhotos(photos: [Photo])
    func didCatchError(error: Error)
}

protocol PhotosRouterInput: AnyObject {
    func addColorInfoToColorInfoScreen(hexColor: String,
                                       rgbColor: String,
                                       photoViewModels: PhotoViewModel)
}
