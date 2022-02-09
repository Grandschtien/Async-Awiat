//
//  PhotosPresenter.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//  
//

import Foundation

final class PhotosPresenter {
	weak var view: PhotosViewInput?
    weak var moduleOutput: PhotosModuleOutput?
    
	private let router: PhotosRouterInput
	private let interactor: PhotosInteractorInput
    
    init(router: PhotosRouterInput, interactor: PhotosInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
    private func makeViewModels(photos: [Photo]) -> [PhotoViewModel] {
        return photos.map { photo in
            let title = photo.title.capitalized
            return PhotoViewModel(albumId: photo.albumId,
                                  id: photo.id,
                                  title: title,
                                  url: photo.url,
                                  thumbnailUrl: photo.thumbnailUrl)
        }
    }
}

extension PhotosPresenter: PhotosModuleInput {
}

extension PhotosPresenter: PhotosViewOutput {
    func loadNextPage(from start: Int, limit: Int) {
        interactor.loadNextPage(from: start, limit: limit)
    }
    
    func viewDidLoad() {
        interactor.loadFirstPage()
    }

}

extension PhotosPresenter: PhotosInteractorOutput {
    func didLoadPhotos(photos: [Photo]) {
        let viewModels = makeViewModels(photos: photos)
        view?.updateView(with: viewModels)
    }
    
    func didCatchError(error: Error) {
        view?.updateView(with: error.localizedDescription)
    }
    
}
