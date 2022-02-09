//
//  UIImageView+Download.swift.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(urlString: String) {
        Task {
            do {
                let imageData = try await NetworkService.loadPhoto(urlString: urlString)
                self.image = UIImage(data: imageData)
            } catch {
                print(error.localizedDescription)
                self.image = nil
            }
        }
    }
}
