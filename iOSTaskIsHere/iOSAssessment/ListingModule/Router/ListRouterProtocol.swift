//
//  ListRouterProtocol.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit
//MARK:-  PRESENTER -> ROUTER
protocol ListRouterProtocol {
    var viewController : UIViewController? {get set}
    static func createModule() -> UIViewController
    func pushToDetailScreen(list: ListEntity , navigationController: UINavigationController )

    
}
