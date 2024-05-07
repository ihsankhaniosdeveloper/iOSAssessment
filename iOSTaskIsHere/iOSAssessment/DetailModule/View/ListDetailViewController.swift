//
//  ListDetailViewController.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import UIKit

class ListDetailViewController: UIViewController {

    var presenter: ListDetailPresenterProtocol?
    @IBOutlet weak var lblUniversity: UILabel?
    @IBOutlet weak var lblState: UILabel?
    @IBOutlet weak var lblCountryCode: UILabel!
    
    @IBOutlet weak var lblCountry: UILabel?

    @IBOutlet weak var webPage: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
        presenter?.viewWillAppear(navigationController: self.navigationController!)
    }
    
    @IBAction private func btnBack_Pressed(_ sender : UIButton) {
        presenter?.back(navigationController: self.navigationController!)
    }
}

extension ListDetailViewController: ListDetailViewProtocol {
    func showDetail(selectedItem: ListEntity) {
        print("show \(selectedItem)")
        lblUniversity?.text = selectedItem.name
        lblState?.text = selectedItem.country
        lblState?.text = selectedItem.country
        lblCountryCode?.text = selectedItem.country

        
    }
}
