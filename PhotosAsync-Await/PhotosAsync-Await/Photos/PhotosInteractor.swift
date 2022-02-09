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
}

extension PhotosInteractor: PhotosInteractorInput {
}
