//
//  ListingEntity.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//
struct ListEntity: Decodable {
    let name: String
    let country: String
    let webPages: [String]
    private enum CodingKeys: String, CodingKey {
        case name
        case country
        case webPages = "web_pages"
    }
    
}
