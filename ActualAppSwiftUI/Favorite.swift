//
//  Favorite.swift
//  ActualAppSwiftUI
//
//  Created by berk birkan on 9.07.2020.
//  Copyright © 2020 berk birkan. All rights reserved.
//


import Foundation
import RealmSwift

class Favorite:Object {
    @objc dynamic var cid = ""
    @objc dynamic var category_name = ""
    @objc dynamic var category_image = ""
    @objc dynamic var nid = ""
    @objc dynamic var news_heading = ""
    @objc dynamic var news_date = ""
    @objc dynamic var news_image = ""
    @objc dynamic var news_description = ""
    @objc dynamic var status = ""
    @objc dynamic var cat_id = ""
    
    override static func primaryKey() -> String? {
        return "nid"
    }
    
}
