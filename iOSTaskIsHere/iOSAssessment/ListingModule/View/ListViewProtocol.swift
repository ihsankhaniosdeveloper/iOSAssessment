//
//  ListViewProtocol.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit
//MARK:- PRESENTER -> VIEW
protocol ListViewProtocol : AnyObject {
    var presenter: ListPresenterProtocol? { get set }
    func showItems(list : [ListEntity])
    func showError(_ message: String?)
    func success(_ message: String?)
    func getView() -> UIView // Add this method

}
