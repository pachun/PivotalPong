//
//  LogGameViewControllerTests.swift
//  PivotalPong
//
//  Created by Pivotal on 2/23/16.
//  Copyright © 2016 Pivotal. All rights reserved.
//

import Quick
import Nimble
import XCTest
@testable import PivotalPong

class LogGameViewControllerSpec: QuickSpec {
    override func spec() {
        var viewController: LogGameViewController!
        
        beforeEach {
            viewController = LogGameViewController()
            
            UIApplication.sharedApplication().keyWindow!.rootViewController = viewController
            let _ = viewController.view
        }
        
        describe(".gotAllPlayers()") {
            it("udpates the list of players") {
                let players = [Player(name: "Brian"), Player(name: "Nick"), Player(name: "Bob")]
                viewController.gotAllPlayers(players)
                
                expect(viewController.logGameView.tableView.numberOfRowsInSection(0)).to(equal(3))
                
                expect(viewController.logGameView.tableView.visibleCells[0].textLabel?.text).toEventually(equal("Brian"))
                expect(viewController.logGameView.tableView.visibleCells[1].textLabel?.text).toEventually(equal("Nick"))
            }
        }
    }
}