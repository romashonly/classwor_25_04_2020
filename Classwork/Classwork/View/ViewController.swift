//
//  ViewController.swift
//  Classwork
//
//  Created by Роман Шуркин on 15.04.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var output: ViewOutputProtocol!
    
    var mainView = View()
    
    override func loadView() {
        self.view = self.mainView
        self.mainView.delegate = self
        self.mainView.delegate!.renderDataSource()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: ViewDelegate {
    
    func renderDataSource() {
        self.output.renderDataSource()
    }
}

extension ViewController: ViewInputProtocol {
    func setDataSource(_ dataSource: [ImageModel]) {
        self.mainView.setDataSource(dataSource)
    }
}
