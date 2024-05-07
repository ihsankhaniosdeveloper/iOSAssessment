//
//  ListingViewController.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import UIKit

class ListViewController: UIViewController, ListViewProtocol{
    var presenter: ListPresenterProtocol?
    @IBOutlet weak var tblView: UITableView!
    var itemList : [ListEntity] = []

    override func viewDidLoad() {
        tblView.registerCells([
            ListingCell.self
        ])
        ActivityIndicator.shared.show(in: self.view)
        presenter?.fetchData()
    }
    
    func getView() -> UIView {
           return self.view
       }
    
    func showItems(list: [ListEntity]) {
        itemList = list
        tblView.delegate = self
        tblView.dataSource = self
        tblView.reloadData()
    }
    
    func showError(_ message: String?) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default,handler: nil))
        present(alert, animated: true, completion: nil)

//        hideProgressIndicator(view: self.view)
    }
    
    func success(_ message: String?) {
//        hideProgressIndicator(view: self.view)
//        tblView.delegate = self
//        tblView.dataSource = self
//        tblView.reloadData()
    }
}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ListingCell.self, for: indexPath)
        cell.config(obj: self.itemList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let navigationController = self.navigationController {
            presenter?.router?.pushToDetailScreen(list: self.itemList[indexPath.row] , navigationController: navigationController)
        }
        
    }
}

