//
//  RoundButton.swift
//  Calculate
//
//  Created by Сергей Анпилогов on 17.08.2022.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    //метод который добавляем в испектор код
    @IBInspectable  var roundButton: Bool = false {
        didSet {
            if roundButton {
                layer.cornerRadius = frame.height / 2
            }
        }
        
    
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }

}
