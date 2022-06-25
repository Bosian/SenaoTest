//
//  UINavigationControllerExtension.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/25.
//

import UIKit

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return self.visibleViewController
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.visibleViewController?.preferredStatusBarStyle ?? .default
    }
}

