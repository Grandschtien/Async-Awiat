//
//  UIColor+RGB.swift
//  PhotosAsync-Await
//
//  Created by Егор Шкарин on 10.02.2022.
//

import UIKit

extension UIColor {
    func getRGBString() -> String {
        let redValue: CGFloat = CIColor(color: self).red
        let greenValue: CGFloat =  CIColor(color: self).green
        let blueValue: CGFloat =  CIColor(color: self).blue
        return "\(redValue) \(greenValue) \(blueValue)"
    }
}
