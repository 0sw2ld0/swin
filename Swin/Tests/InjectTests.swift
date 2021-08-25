//
//  InjectTests.swift
//  Swin
//
//  Created by Oswaldo Leon on 6/12/21.
//
import XCTest
@testable import Swin

class InjectTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        Swin.stop()
    }
    
    func testInjectDog_CreatedDog_Factory_VerifySay() throws {
        let testModule = module { container in
            container.factory { Dog(name: "Fido") as Animal}
        }
        Swin.modules(testModule)
        Swin.start()
        let petOwner = PetOwner()
        XCTAssertEqual(petOwner.dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testInjectDog_CreatedDog_Single_VerifySay() throws {
        let testModule = module { container in
            container.single { Dog(name: "Fido") as Animal}
        }
        Swin.modules(testModule)
        Swin.start()
        let petOwner = PetOwner()
        XCTAssertEqual(petOwner.dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testInjectDog_CreatedDog_Factory_WithNamed_VerifySay() throws {
        let testModule = module { container in
            container.factory(named("Watchman")) { Dog(name: "Fido") as Animal}
        }
        Swin.modules(testModule)
        Swin.start()
        let watchman = Watchman()
        XCTAssertEqual(watchman.dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testInjectDog_CreatedDog_Single_WithNamed_VerifySay() throws {
        let testModule = module { container in
            container.single(named("Watchman")) { Dog(name: "Fido") as Animal}
        }
        Swin.modules(testModule)
        Swin.start()
        let watchman = Watchman()
        XCTAssertEqual(watchman.dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
}
