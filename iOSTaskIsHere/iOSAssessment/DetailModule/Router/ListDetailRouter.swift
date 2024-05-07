//
//  ListDetailRouter.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit

class ListDetailRouter : ListDetailRouterProtocol {
    
    var viewController: UIViewController?

    static func createModule(detail: ListEntity) -> UIViewController {
        
       guard  let view = mainstoryboard.instantiateViewController(withIdentifier: "ListDetailViewController") as? ListDetailViewController else { return UIViewController() }
        
        let interactor = ListDetailInteractor()
        let presenter = ListDetailPresenter()
        let router = ListDetailRouter()
        view.presenter = presenter
        
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        presenter.didSelectItem(detail)
        interactor.presenter = presenter
        router.viewController = view
        
        return view

    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
    
    
    
}
