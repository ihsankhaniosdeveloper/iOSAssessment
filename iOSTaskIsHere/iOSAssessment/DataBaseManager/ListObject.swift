//
//  UniversityObject.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import RealmSwift

class ListObject: Object {
    @objc dynamic var name: String = "" // Ensure this property is present and annotated with @objc dynamic
    @objc dynamic var country: String = ""
    let webPages = List<String>()

    override static func primaryKey() -> String? {
        return "name"
    }
    var entity: ListEntity {
            return ListEntity(name: name, country: country, webPages: Array(webPages))
        }

    convenience init(from university: ListEntity) {
        self.init()
        self.name = university.name
        self.country = university.country
        self.webPages.append(objectsIn: university.webPages)
    }
}
