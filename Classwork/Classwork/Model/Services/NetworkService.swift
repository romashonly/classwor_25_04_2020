//
//  NetworkService.swift
//  Classwork
//
//  Created by Роман Шуркин on 15.04.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import Foundation
import Alamofire

var NetService: NetworkServiceProtocol = NetworkService()

protocol NetworkServiceProtocol: AnyObject {
    
    func downloadDataSource(completion: @escaping ([ImageModel])->() )
}

class NetworkService: NetworkServiceProtocol {
    
    let urlString = "https://jsonplaceholder.typicode.com/photos"
    
    func downloadDataSource(completion: @escaping ([ImageModel])->() ) {
        
        AF.request(self.urlString).responseDecodable(of: [ImageModel].self) { response in
            guard let models = response.value else { return }
            
            completion(Array(models[0..<15]))
        }
    }
}
