//
//  PlayerServiceDelegate.swift
//  PivotalPong
//
//  Created by Pivotal on 2/22/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import Foundation

protocol PlayerServiceDelegate {
    func gotAllPlayers(players: [Player])
}