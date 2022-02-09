//
//  Photo.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
