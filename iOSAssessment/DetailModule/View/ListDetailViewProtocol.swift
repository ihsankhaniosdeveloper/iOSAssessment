//
//  ListDetailViewProtocol.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
protocol ListDetailViewProtocol : AnyObject {
    var presenter: ListDetailPresenterProtocol? { get set }
    
    func showDetail(selectedItem : ListEntity)
}
