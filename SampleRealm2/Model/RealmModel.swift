//
//  RealmModel.swift
//  SampleRealm2
//
//  Created by 原田摩利奈 on 2019/01/29.
//  Copyright © 2019 原田摩利奈. All rights reserved.
//

import Foundation
import RealmSwift

class RealmModel: Object {
    @objc dynamic var date: String!
    @objc dynamic var text: String!
    @objc dynamic var image: NSData!
}
