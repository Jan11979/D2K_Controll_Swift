//
//  FetchButton.swift
//  D2K_Controll
//
//  Created by Jan Peltzer on 05.04.22.
//

import Foundation
import UIKit

@IBDesignable
public class FetchButton: UIButton {
    @IBInspectable public var borderColor:UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable public var borderWidth:CGFloat = 0 {
        didSet {
        layer.borderWidth = borderWidth
        }
    }
    @IBInspectable public var cornerRadius:CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
