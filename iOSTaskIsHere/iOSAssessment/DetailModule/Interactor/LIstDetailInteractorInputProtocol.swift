//
//  LIstDetailInteractorInputProtocol.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit
protocol ListDetailInteractorInputProtocol: AnyObject {
    var presenter: ListDetailInteractorOutputProtocol? { get set }
    func back(navigationController: UINavigationController)
}
