//
//  ListInteractorProtocol.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation

//MARK:- PRESENTER -> INTERACTOR
protocol ListInteractorInputProtocol: AnyObject {
    var presenter: ListInteractorOutputProtocol? { get set }
    func fetchData()
    
    
}
