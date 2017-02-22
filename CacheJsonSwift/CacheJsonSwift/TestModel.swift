//
//  TestModel.swift
//  CacheJsonSwift
//
//  Created by Dzy on 22/02/2017.
//  Copyright © 2017 Dzy. All rights reserved.
//

import UIKit

class TestModel: NSObject {

    var name : String
    var age : String

    init(dict: [String : NSObject]) {
        name = dict["error_message"] as! String
        age = dict["error_type"] as! String
    }
    
}
