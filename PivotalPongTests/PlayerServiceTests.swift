import Quick
import Nimble
@testable import PivotalPong

class PlayerServiceSpec: QuickSpec {
    override func spec() {
        describe("#getAllPlayers()") {
            it("makes a request to the backend and calls its delegate with the response") {
                let expectation = self.expectationWithDescription("PlayerServiceDelegate.gotAllPlayers was called.")
                func expectationWrapper() { expectation.fulfill() }
                
                struct MyPlayerServiceDelegate: PlayerServiceDelegate {
                    var expectation: (() -> ())
                    
                    func gotAllPlayers(players: [Player]) {
                        expect(players.count).to(equal(2))
                        expect(players.first?.name).to(equal("Shanfan"))
                        expect(players.last?.name).to(equal("Jen"))
                        expectation()
                    }
                }
                let playerServiceDelegate = MyPlayerServiceDelegate(expectation: expectationWrapper)
                
                let playerService = PlayerService()
                playerService.delegate = playerServiceDelegate
                
                playerService.getAllPlayers()
                
                self.waitForExpectationsWithTimeout(1) { error in
                    expect(error).to(beNil())
                }
            }
        }
    }
}
