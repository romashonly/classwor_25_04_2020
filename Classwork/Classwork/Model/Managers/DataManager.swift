//
//  DataManager.swift
//  Classwork
//
//  Created by Роман Шуркин on 15.04.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

protocol DataManagerProtocol: AnyObject {
    
    func getDataSource(completion: @escaping ([ImageModel])->() )
}

class DataManager: DataManagerProtocol {
    
    func getDataSource(completion: @escaping ([ImageModel])->() ) {
        
        let models = DBManager.getModels()
        
        if models.isEmpty {
            NetService.downloadDataSource { (imageModels) in
                
                DBManager.save(imageModels)
                completion(imageModels)
            }
        } else {
            completion(models)
        }
    }
}
