//
//  BaseViewController.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/25.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {

    private let navigationBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0.5529411765, blue: 0.8431372549, alpha: 1)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let navigationController = navigationController {
//            let barAppearance = navigationController.navigationBar.standardAppearance
//            barAppearance.configureWithTransparentBackground()
//            barAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//            navigationController.navigationBar.standardAppearance = barAppearance
        }
        
        // Hide back button text
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        setupNavigationBackground()
        updateNavigationBackground()
    }
    
    override func viewDidLayoutSubviews() {
        updateNavigationBackground()
        
        super.viewDidLayoutSubviews()
    }
    
    private func setupNavigationBackground() {

        self.view.addSubview(navigationBackgroundView)
        navigationBackgroundView.snp.makeConstraints { make in
            make.left.top.right.equalTo(0)
            make.height.equalTo(0)
        }
    }

    func updateNavigationBackground() {
        navigationBackgroundView.snp.updateConstraints { make in
            make.height.equalTo(self.view.safeAreaInsets.top)
        }

        navigationBackgroundView.isHidden = navigationController == nil
    }
}
