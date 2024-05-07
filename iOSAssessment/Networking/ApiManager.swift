//
//  ApiManager.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import UIKit
import Alamofire
typealias SuccessHandler<T> = (T) -> Void
typealias FailureHandler = (String) -> Void

class ApiManager: NSObject {
    static let shared = ApiManager()
    private override init() {
        super.init()
    }
    func request<T: Decodable>(url: String?, method: HTTPMethod, timeoutInterval: TimeInterval = 180, success: @escaping SuccessHandler<T>, failure: @escaping FailureHandler) {
        AF.session.configuration.timeoutIntervalForRequest = timeoutInterval
        guard let url = url else {
            failure("URL should not be empty")
            return
        }
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
        ]
        
        AF.request(url, method: method, headers: headers).validate(statusCode: 200..<600).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let value = try decoder.decode(T.self, from: data)
                    success(value)
                } catch {
                    failure(error.localizedDescription)
                }
            case .failure(let error):
                failure(error.localizedDescription)
            }
        }
    }
}
