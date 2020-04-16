//
//  ImageModel.swift
//  Classwork
//
//  Created by Роман Шуркин on 15.04.2020.
//  Copyright © 2020 Роман Шуркин. All rights reserved.
//

import RealmSwift

@objcMembers
class ImageModel: Object, Decodable {
    
    dynamic var title: String = ""
    dynamic var urlPath: String = ""
    
    enum CodingKeys: String, CodingKey {
        case title
        case urlPath = "thumbnailUrl"
    }
}
