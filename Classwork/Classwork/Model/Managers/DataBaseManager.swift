//
//  DataBaseManager.swift
//  Classwork
//
//  Created by Роман Шуркин on 16.04.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import Foundation
import RealmSwift

var DBManager: DataBaseManagerProtocol = DataBaseManager()

protocol DataBaseManagerProtocol {
    
    func save(_ models: [ImageModel])
    
    func getModels() -> [ImageModel]
}

class DataBaseManager: DataBaseManagerProtocol {
    
    fileprivate lazy var realm = try! Realm(configuration: .defaultConfiguration)
    
    func save(_ models: [ImageModel]) {
        
        try! realm.write({
            realm.add(models)
        })
    }
    
    func getModels() -> [ImageModel] {
        
        return Array(realm.objects(ImageModel.self))
    }
    
}
