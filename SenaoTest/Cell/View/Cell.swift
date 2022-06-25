//
//  Cell.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/25.
//

import UIKit
import Kingfisher

final class Cell: UITableViewCell, Viewer {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    typealias ViewModelType = CellViewModel
    var viewModel: ViewModelType! {
        didSet {
            icon.kf.setImage(with: URL(string: viewModel.model.imageUrl))
            priceLabel.text = viewModel.model.formatedPrice
            titleLabel.text = viewModel.model.martName
        }
    }
}
