//
//  circleButton.swift
//  Pard_1_storyboard
//
//  Created by 김사랑 on 9/11/24.
//

import Foundation
import UIKit



@IBDesignable


class circleButton: UIButton{
    
    //인스팩터 패너레서 사용될 수 있도록 설정
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
            
        }
    }
}
