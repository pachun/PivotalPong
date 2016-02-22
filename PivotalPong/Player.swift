//
//  Player.swift
//  PivotalPong
//
//  Created by Pivotal on 2/22/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import Foundation

class Player: NSObject, NSCoding {
    let name: String
    
    init(name:String) {
        self.name = name
        
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: "name")
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let name = aDecoder.decodeObjectForKey("name") as? String {
            self.name = name
        } else {
            self.name = ""
        }
        
        super.init()
    }
}