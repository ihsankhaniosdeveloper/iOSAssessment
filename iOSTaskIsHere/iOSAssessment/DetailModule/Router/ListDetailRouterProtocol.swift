//
//  ListDetailRouterProtocol.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit
protocol ListDetailRouterProtocol {
    var viewController: UIViewController? { get set }
    static func createModule(detail: ListEntity) -> UIViewController
}
