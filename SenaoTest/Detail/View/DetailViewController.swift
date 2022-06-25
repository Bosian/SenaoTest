//
//  DetailViewController.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/24.
//

import UIKit
import Kingfisher

final class DetailViewController: BaseViewController, Viewer, Navigatable {
    
    @IBOutlet weak var navigationBackgroundHeight: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var martIdLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    typealias ViewModelType = DetailViewModel
    var viewModel: DetailViewModel! {
        didSet {
            imageView.kf.setImage(with: URL(string: viewModel.navigationParameter.model.imageUrl))
            martIdLabel.text = "\(viewModel.navigationParameter.model.martId)"
            nameLabel.text = viewModel.navigationParameter.model.martName
            priceLabel.text = viewModel.navigationParameter.model.formatedPrice
        }
    }

    typealias NavigationParameterType = DetailNavigationParameter
    var navigationParameter: DetailNavigationParameter!

    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateNavigationBarStyle()
        viewModel = ViewModelType(navigationParameter: navigationParameter)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
