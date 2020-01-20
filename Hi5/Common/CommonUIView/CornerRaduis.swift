//
//  CornerRaduis.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright © 2019 FudexApp. All rights reserved.
//

import Foundation
import UIKit


class CreateCornerRauis {
    
    static func viewRaduis(view:UIView , number: CGFloat)-> UIView{
        view.layer.cornerRadius = number
        return view
    }
    
    static func ButtonRaduis(button:UIButton , number: CGFloat)-> UIButton{
        button.layer.cornerRadius = number
        return button
    }
    
    static func imageViewRaduis(view:UIImageView , number: CGFloat)-> UIImageView {
        view.layer.cornerRadius = number
        return view
    }
}
