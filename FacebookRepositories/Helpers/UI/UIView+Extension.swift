//
//  UIView+Extension.swift
//  FacebookRepositories
//
//  Created by huda elhady on 23/01/2021.
//  Copyright © 2021 HudaElhady. All rights reserved.
//

import UIKit

extension UIView{
    
    @IBInspectable var cornerRadius : CGFloat{
        set{
            self.layer.cornerRadius = newValue
        }
        get{
            return self.layer.cornerRadius
        }
    }
    @IBInspectable var borderWidth : CGFloat{
        set{
            self.layer.borderWidth = newValue
        }
        get{
            return self.layer.borderWidth
        }
    }
    @IBInspectable var borderColor : UIColor{
        set{
            self.layer.borderColor = newValue.cgColor        }
        get{
            return UIColor(cgColor: self.layer.borderColor! )
        }
    }
}


