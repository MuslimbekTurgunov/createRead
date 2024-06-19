//
//  dataModel.swift
//  createRead
//
//  Created by Macbook on 02/03/22.
//

import Foundation
import Realm
import RealmSwift


class TaskDM: Object {
    
    @objc dynamic var title: String?
    @objc dynamic var desc: String?
    @objc dynamic var _id: String?
    
    override class func primaryKey() -> String? {
        "_id"
    }

}
