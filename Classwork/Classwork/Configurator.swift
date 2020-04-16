//
//  Configurator.swift
//  Classwork
//
//  Created by Роман Шуркин on 15.04.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import Foundation
import UIKit

class Configurator {
    
    class func configuredModule() -> UIViewController {
        
        let presenter = Presenter()
        let dataManager = DataManager()
        
        let vc = ViewController()

        vc.output = presenter
        
        presenter.view = vc
        presenter.dataManager = dataManager
        
        return vc
    }
}
