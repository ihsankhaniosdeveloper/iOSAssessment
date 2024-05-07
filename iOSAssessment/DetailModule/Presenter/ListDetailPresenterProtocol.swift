//
//  ListDetailPresenterProtocol.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//


import Foundation
import UIKit


protocol ListDetailPresenterProtocol : AnyObject {

    var router: ListDetailRouterProtocol? { get set }
    var interactor: ListDetailInteractorInputProtocol? { get set }
    var view: ListDetailViewProtocol? { get set }
    func viewWillAppear(navigationController:UINavigationController)
    func back(navigationController: UINavigationController)
    func viewDidLoad()
}



