//
//  Presenter.swift
//  Classwork
//
//  Created by Роман Шуркин on 15.04.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import Foundation

class Presenter {
    
    weak var view: ViewInputProtocol!
    var dataManager: DataManagerProtocol!
}

extension Presenter: ViewOutputProtocol {
    
    func renderDataSource() {
        dataManager.getDataSource { (dataSource) in
            self.view.setDataSource(dataSource)
        }
    }
}
