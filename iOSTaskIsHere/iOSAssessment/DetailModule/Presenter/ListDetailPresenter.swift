//
//  ListDetailPresenter.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//


import Foundation
import UIKit

class ListDetailPresenter: ListDetailPresenterProtocol {

    var router: ListDetailRouterProtocol?
    var interactor: ListDetailInteractorInputProtocol?
    var view: ListDetailViewProtocol?
    private var isViewLoaded: Bool = false
    private var bufferedData: ListEntity? // Buffer to store received data
 
    func viewDidLoad() {
          // Perform any additional setup when the view loads
          isViewLoaded = true

          // If there's buffered data and the view is loaded, display it
          if let bufferedData = bufferedData {
              view?.showDetail(selectedItem: bufferedData)
          }
      }
    func didSelectItem(_ item : ListEntity) {
        bufferedData = item

        // Check if the view is loaded, and if so, display the data
        if isViewLoaded, let bufferedData = bufferedData {
            view?.showDetail(selectedItem: bufferedData)
        }
    }

    func viewWillAppear(navigationController: UINavigationController) {
          navigationController.setNavigationBarHidden(true, animated: true)
        
    }
    func back(navigationController: UINavigationController) {
        interactor?.back(navigationController: navigationController)
    }
    deinit {
            // Reset the flag when the view is deallocated
            isViewLoaded = false
        }
}

extension ListDetailPresenter : ListDetailInteractorOutputProtocol {
    
    func didLoadDetail(list: ListEntity) {
        view?.showDetail(selectedItem: list)

    }
}
