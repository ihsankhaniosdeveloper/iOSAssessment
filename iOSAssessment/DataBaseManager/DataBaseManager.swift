//
//  DataBaseManager.swift
//  iOSAssessment
//
//  Created by TNC_10473 on 06/05/2024.
//

import Foundation
import RealmSwift
class DataBaseManager {
    static let shared = DataBaseManager()
    private let realm: Realm
    
    private init() {
        do {
            let config = Realm.Configuration(
                schemaVersion: 1, // Update the schema version
                migrationBlock: { migration, oldSchemaVersion in
                    if oldSchemaVersion < 1 {
                        //
                    }
                }
            )
            self.realm = try Realm(configuration: config)
        } catch {
            fatalError("Failed to initialize Realm: \(error)")
        }
    }
    func cacheList(_ list: [ListEntity]) {
        guard !list.isEmpty  else {
            print("to prevent cache an empty list")
            return
        }
        do {
            try realm.write {
                realm.add(list.map(ListObject.init), update: .modified)
            }
        } catch {
            print("Error saving universities to Realm: \(error.localizedDescription)")
        }
        
    }
    
    
    func fetchList() -> [ListEntity]? {
        do {
            let listObjects = realm.objects(ListObject.self)
            let listEntities = Array(listObjects).map { $0.entity }
            guard !listEntities.isEmpty else {
                print("No data found in the database.")
                return nil
            }
            
            return listEntities
        }
        //           let universityObjects = realm.objects(ListObject.self)
        //        return universityObjects.map { $0.entity }
    }
    
}
