//
//  PlayerService.swift
//  PivotalPong
//
//  Created by Pivotal on 2/22/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import Foundation

class PlayerService {
    var delegate: PlayerServiceDelegate?
    
    func getAllPlayers() {
        delegate?.gotAllPlayers(
            [
                Player(name: "Shanfan"),
                Player(name: "Jen"),
            ]
        )
    }
}
