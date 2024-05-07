//
//  ListingInteractor.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit
class ListInteractor : ListInteractorInputProtocol {
    var presenter: ListInteractorOutputProtocol?

    func fetchData() {
        let context = (presenter)
        ApiManager.shared.request(url: APIConstants.apiUrl, method: .get, success: { (list: [ListEntity]) in
            DataBaseManager.shared.cacheList(list)
            context?.didFetchData(list: list)
        }, failure: {  error in
            if let cachedUniversities = DataBaseManager.shared.fetchList(), !cachedUniversities.isEmpty{
                context?.didFetchData(list: cachedUniversities)
            } else {
                context?.didFailFetch(with: "Failed to fetch data. Please try again later.")
                // No data in local database, show error message
            }
        })
    }
}
