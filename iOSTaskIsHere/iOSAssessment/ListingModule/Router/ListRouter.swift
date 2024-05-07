//
//  ListRouter.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit

class ListRouter : ListRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        guard  let view = mainstoryboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController else { return UIViewController() }
        let interactor = ListInteractor()
        let presenter = ListPresenter()
        let router = ListRouter()
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    func pushToDetailScreen(list: ListEntity, navigationController: UINavigationController) {
        let detailVC = ListDetailRouter.createModule(detail: list)
        viewController?.navigationController?.pushViewController(detailVC, animated: true)

    }
}
