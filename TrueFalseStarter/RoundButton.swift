//
//  RoundButtons.swift
//  TrueFalseStarter
//
//  Created by Max Ramirez on 8/28/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//


// Youtube helped me out with this neat feature
import UIKit
// InterfaceBuilder Designable
@IBDesignable


// SubClass of UIButton so it shows up in my attributes inspecter in the storyboard
class RoundButton: UIButton {
    // CornerRadius
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    // BorderWidth
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    // Color
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    

}

