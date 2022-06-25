//
//  ListViewController.swift
//  SenaoTest
//
//  Created by 劉柏賢 on 2022/6/25.
//

import UIKit
import NSObject_Rx

final class ListViewController: BaseViewController, Viewer {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    
    typealias ViewModelType = ListViewModel
    var viewModel: ViewModelType!

    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ViewModelType()
        bindViewModel()
        
        textField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)

        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        handlePrepare(for: segue, sender: sender)
    }

    private func bindViewModel() {
        viewModel.cellViewModels
            .asDriver()
            .drive { [weak self] (value: [CellViewModel]) in
                self?.tableView.reloadData()
            }
            .disposed(by: rx.disposeBag)
    }

    @IBAction func textChanged(_ sender: UITextField) {
        let martName: String = sender.text ?? ""
        print(martName)
        viewModel.search(martName: martName)
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let id: String = "cell"
        let cell: (UITableViewCell & DataContextProtocol) = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! (UITableViewCell & DataContextProtocol)
        cell.dataContext = viewModel.cellViewModels.value[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        self.view.endEditing(true)
        
        let model = viewModel.cellViewModels.value[indexPath.row].model
        let navigationParameter = DetailNavigationParameter(model: model)
        performSegue(withIdentifier: "\(DetailViewController.self)", sender: navigationParameter)
    }
}

extension ListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
