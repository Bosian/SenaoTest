//
//  UIViewExtension.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/25.
//

import UIKit

extension UIView {
    
    /**
     外框 圓角半徑
     */
    @IBInspectable public var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
            
            if newValue != 0 {
                self.layer.masksToBounds = true
                self.clipsToBounds = true
            }
        }
    }
}
