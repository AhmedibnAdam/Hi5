//
//  CreateBorder.swift
//  Hi5
//
//  Created by Adam on 12/26/19.
//  Copyright © 2019 FudexApp. All rights reserved.
//

import Foundation
import UIKit

class CreateBorder {
    
    static func viewBorder(view:UIView , width : CGFloat , color : CGColor)-> UIView{
        view.layer.borderWidth = width
        view.layer.borderColor = color
        return view
    }
    
    static func buttonBorder(button:UIButton , width : CGFloat , color : CGColor)-> UIButton{
           button.layer.borderWidth = width
           button.layer.borderColor = color
           return button
       }
}
