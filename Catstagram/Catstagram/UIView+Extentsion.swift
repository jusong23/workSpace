//
//  UIView+Extentsion.swift
//  Catstagram
//
//  Created by 이주송 on 2022/03/31.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat { //모따기
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
