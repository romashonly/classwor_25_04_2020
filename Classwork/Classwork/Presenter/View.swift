//
//  View.swift
//  Classwork
//
//  Created by Роман Шуркин on 15.04.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

protocol ViewDelegate: AnyObject {
    
    func renderDataSource()
}

class View: UIView {
    
    weak var delegate: ViewDelegate?
    
    var dataSource: [ImageModel]? = nil
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        self.backgroundColor = .white
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ImageCell")
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.tableView)
        self.tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
    }
    
    func setDataSource(_ dataSource: [ImageModel]) {
        self.dataSource = dataSource
        self.tableView.reloadData()
    }
}

extension View: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
        
        guard let dataSource = self.dataSource else {
            return cell
        }
        
        let imageStruct = dataSource[indexPath.row]
        
        cell.selectionStyle = .none
        
        cell.textLabel?.text = imageStruct.title
        cell.imageView?.kf.setImage(with: URL(string: imageStruct.urlPath), placeholder: UIImage(named: "image"))
        
        return cell
    }
}

extension View: UITableViewDelegate {
    
}
