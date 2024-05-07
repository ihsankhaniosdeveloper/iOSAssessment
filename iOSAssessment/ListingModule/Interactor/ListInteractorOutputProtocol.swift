//
//  ListInteractorOutPutProtocol.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
//MARK:- INTERACTOR -> PRESENTER
protocol ListInteractorOutputProtocol {
    func didFetchData(list : [ListEntity])
    func didFailFetch(with message: String?)
}
