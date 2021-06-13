//
//  SwinTests.swift
//  Swin
//
//  Created by Oswaldo Leon on 6/12/21.
//
import XCTest
@testable import Swin

class SwinTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        Swin.stop()
    }
    
    func testSwin_RemovedModuleRegistered_VerifyCount() throws {
        let testModule = module { container in
            container.single(named("Watchman")) { Dog(name: "Fido") as Animal}
        }
        Swin.modules(testModule)
        Swin.start()
        XCTAssertEqual(Swin.shared.modules.count, 1, "The Say() should have returned Guau Guau")

        Swin.remove(module: testModule)
        XCTAssertEqual(Swin.shared.modules.count, 0, "The Say() should have returned Guau Guau")

    }
    
    func testSwin_RemovedModulesRegistered_VerifyCount() throws {
        let testModule1 = module { container in
            container.single(named("Watchman1")) { Dog(name: "Fido1") as Animal}
        }
        let testModule2 = module { container in
            container.single(named("Watchman2")) { Dog(name: "Fido2") as Animal}
        }
        
        XCTAssertNotEqual(testModule1.unique, testModule2.unique, "Different unique")
        
        Swin.modules(testModule1, testModule2)
        Swin.start()
        XCTAssertEqual(Swin.shared.modules.count, 2, "Verify count of Modules")

        Swin.remove(module: testModule2)
        XCTAssertEqual(Swin.shared.modules.count, 1, "Verify count of Modules after remove")

    }
    
    func testSwin_RemovedModulesNoRegistered_VerifyCount() throws {
        let testModule1 = module { container in
            container.single(named("Watchman1")) { Dog(name: "Fido1") as Animal}
        }
        let testModule2 = module { container in
            container.single(named("Watchman2")) { Dog(name: "Fido2") as Animal}
        }
        
        XCTAssertNotEqual(testModule1.unique, testModule2.unique, "Different unique")
        
        Swin.modules(testModule1)
        Swin.start()
        XCTAssertEqual(Swin.shared.modules.count, 1, "Verify count of Modules")

        Swin.remove(module: testModule2)
        XCTAssertEqual(Swin.shared.modules.count, 1, "Verify count of Modules after remove")
        
        Swin.remove(module: testModule1)
        XCTAssertEqual(Swin.shared.modules.count, 0, "Verify count of Modules after remove")

    }
}
