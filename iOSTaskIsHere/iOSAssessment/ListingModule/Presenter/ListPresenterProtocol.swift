//
//  ListPresenterProtocol.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit
//MARK:- VIEW -> PRESENTER
protocol ListPresenterProtocol : AnyObject {
    var router : ListRouterProtocol? {get set}
    var interactor: ListInteractorInputProtocol? { get set }
    var view: ListViewProtocol? { get set }
    func fetchData()
    func viewWillAppear(navigationController:UINavigationController)
    
}
