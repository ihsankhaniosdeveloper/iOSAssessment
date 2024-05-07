//
//  ListPresenter.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit

class ListPresenter  : ListPresenterProtocol {
    var router: ListRouterProtocol?
    
    var interactor: ListInteractorInputProtocol?
    
    weak var view: ListViewProtocol?

    func fetchData() {
        interactor?.fetchData()
    }
    
    func viewWillAppear(navigationController: UINavigationController) {
        navigationController.setNavigationBarHidden(true, animated: true)
    }
    
    func showDetail(list: ListEntity , navigationController: UINavigationController ) {
        router?.pushToDetailScreen(list: list, navigationController: navigationController)
    }

}

extension ListPresenter : ListInteractorOutputProtocol {
    func didFetchData(list: [ListEntity]) {
        view?.showItems(list: list)
        if let view = view {
            ActivityIndicator.shared.hide(from: view.getView())
        }
    }
    
    func didFailFetch(with message: String?) {
        if let view = view {
            ActivityIndicator.shared.hide(from: view.getView())
        }
        view?.showError(message)
        
    }
    
    
    
    
}
