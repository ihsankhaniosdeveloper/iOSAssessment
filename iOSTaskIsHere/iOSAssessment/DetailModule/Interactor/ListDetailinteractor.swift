//
//  ListDetailInteractor.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit

class ListDetailInteractor : ListDetailInteractorInputProtocol {
    var presenter : ListDetailInteractorOutputProtocol?
    
    func selectItem(_ item: ListEntity) {
        presenter?.didLoadDetail(list: item)
    }

    func back(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
