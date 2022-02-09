//
//  PhotosViewController.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 09.02.2022.
//  
//

import UIKit

final class PhotosViewController: UIViewController {
    private let output: PhotosViewOutput
    private let phototsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        return collection
    }()
    private let collectionViewInsets =  UIEdgeInsets(top: 0,
                                                         left: 10,
                                                         bottom: 10,
                                                         right: 10)
    
    init(output: PhotosViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
//MARK: - Setup UI
extension PhotosViewController {
    private func setup() {
        navigationController?.isNavigationBarHidden = false
        title = "Photos"
        view.backgroundColor = .white
        view.addSubview(phototsCollection)
        phototsCollection.pins()
        phototsCollection.dataSource = self
        phototsCollection.delegate = self
        phototsCollection.register(PhotoCell.self)
        phototsCollection.contentInset = collectionViewInsets
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width / 2 - 20,
                          height: view.frame.width / 2 - 20)
    }
}

//MARK: - UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = phototsCollection.dequeueCell(cellType: PhotoCell.self, for: indexPath)
        cell.configure(imageUrl: "")
        return cell
    }
    
}
extension PhotosViewController: PhotosViewInput {
}
