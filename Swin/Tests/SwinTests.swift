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
        SwinManager.stop()
    }
    
    func testSwin_RemovedModuleRegistered_VerifyCount() throws {
        let testModule = module { container in
            container.single(named("Watchman")) { Dog(name: "Fido") as Animal}
        }
        SwinManager.modules(testModule)
        SwinManager.start()
        XCTAssertEqual(SwinManager.shared.modules.count, 1, "The Say() should have returned Guau Guau")

        SwinManager.remove(module: testModule)
        XCTAssertEqual(SwinManager.shared.modules.count, 0, "The Say() should have returned Guau Guau")

    }
    
    func testSwin_RemovedModulesRegistered_VerifyCount() throws {
        let testModule1 = module { container in
            container.single(named("Watchman1")) { Dog(name: "Fido1") as Animal}
        }
        let testModule2 = module { container in
            container.single(named("Watchman2")) { Dog(name: "Fido2") as Animal}
        }
        
        XCTAssertNotEqual(testModule1.moduleId, testModule2.moduleId, "Different unique")
        
        SwinManager.modules(testModule1, testModule2)
        SwinManager.start()
        XCTAssertEqual(SwinManager.shared.modules.count, 2, "Verify count of Modules")

        SwinManager.remove(module: testModule2)
        XCTAssertEqual(SwinManager.shared.modules.count, 1, "Verify count of Modules after remove")

    }
    
    func testSwin_RemovedModulesNoRegistered_VerifyCount() throws {
        let testModule1 = module { container in
            container.single(named("Watchman1")) { Dog(name: "Fido1") as Animal}
        }
        let testModule2 = module { container in
            container.single(named("Watchman2")) { Dog(name: "Fido2") as Animal}
        }
        
        XCTAssertNotEqual(testModule1.moduleId, testModule2.moduleId, "Different unique")
        
        SwinManager.modules(testModule1)
        SwinManager.start()
        XCTAssertEqual(SwinManager.shared.modules.count, 1, "Verify count of Modules")

        SwinManager.remove(module: testModule2)
        XCTAssertEqual(SwinManager.shared.modules.count, 1, "Verify count of Modules after remove")
        
        SwinManager.remove(module: testModule1)
        XCTAssertEqual(SwinManager.shared.modules.count, 0, "Verify count of Modules after remove")

    }
    
    func testSwin_RemovedModulesAdded_VerifyCount() throws {
        let testModule1 = module { container in
            container.single(named("Watchman1")) { Dog(name: "Fido1") as Animal}
        }
        let testModule2 = module { container in
            container.single(named("Watchman2")) { Dog(name: "Fido2") as Animal}
        }
        
        XCTAssertNotEqual(testModule1.moduleId, testModule2.moduleId, "Different unique")
        SwinManager.add(module: testModule1)
        SwinManager.add(module: testModule2)
        SwinManager.start()
        XCTAssertEqual(SwinManager.shared.modules.count, 2, "Verify count of Modules")

        SwinManager.remove(module: testModule2)
        XCTAssertEqual(SwinManager.shared.modules.count, 1, "Verify count of Modules after remove")

    }
}
