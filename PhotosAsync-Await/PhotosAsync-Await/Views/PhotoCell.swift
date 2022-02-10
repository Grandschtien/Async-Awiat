//
//  PhotoCell.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .lightGray
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    var getImageColor: UIColor? {
        return imageView.image?.averageColor
    }
    func configure(with viewModel: PhotoViewModel) {
        imageView.setImage(urlString: viewModel.url)
        setup()
    }
    private func setup() {
        contentView.addSubview(containerView)
        containerView.pins()
        containerView.addSubview(imageView)
        let imageInsets = UIEdgeInsets(top: 10,
                                       left: 0,
                                       bottom: 0,
                                       right: 0)
        imageView.pins(imageInsets)
    }
    override func prepareForReuse() {
        imageView.image = nil
    }
}
