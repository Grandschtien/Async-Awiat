//
//  ColorInfoViewController.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 10.02.2022.
//  
//

import UIKit

final class ColorInfoViewController: UIViewController {
    private let output: ColorInfoViewOutput
    private let nameOfColor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    private let rgbColor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    private let hexColor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    init(output: ColorInfoViewOutput) {
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
    
    private func setup() {
        
    }
}

extension ColorInfoViewController: ColorInfoViewInput {
    func updateViewWith(viewModel: ColorInfoViewModel) {
        let hexColor = String(viewModel.hexColor.dropFirst(11))
        view.backgroundColor = UIColor.hexStringToUIColor(hex: hexColor)
    }
}
