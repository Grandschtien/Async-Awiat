//
//  PhotosInteractor.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//  
//

import Foundation

final class PhotosInteractor {
	weak var output: PhotosInteractorOutput?
    private let networkService: NetworkServiceProtocol = NetworkService()
}

extension PhotosInteractor: PhotosInteractorInput {
    func loadFirstPage() {
        Task {
            do {
                let photosData = try await networkService.getData(start: 1, limit: 20)
                let decodedPhotos = try JSONDecoder().decode([Photo].self, from: photosData)
                output?.didLoadPhotos(photos: decodedPhotos)
            } catch {
                output?.didCatchError(error: error)
            }
        }
    }
    
    func loadNextPage(from start: Int, limit: Int) {
        Task {
            do {
                let photosData = try await networkService.getData(start: start, limit: limit)
                let decodedPhotos = try JSONDecoder().decode([Photo].self, from: photosData)
                output?.didLoadPhotos(photos: decodedPhotos)
            } catch {
                output?.didCatchError(error: error)
            }
        }
    }
}
