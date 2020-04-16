//
//  ViewProtocol.swift
//  Classwork
//
//  Created by Роман Шуркин on 15.04.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import Foundation

protocol ViewInputProtocol: AnyObject {
    
    func setDataSource(_ dataSource: [ImageModel])
}

protocol ViewOutputProtocol: AnyObject {
    
    func renderDataSource()
}
