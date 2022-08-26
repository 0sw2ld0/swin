//
//  InjectTests.swift
//  Swin
//
//  Created by Oswaldo Leon on 6/12/21.
//
import XCTest
@testable import Swin

class ScopeTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        SwinManager.stop()
    }
    
    func testInjectDog_CreatedDog_Factory_VerifySay() throws {
        let testModule = module { container in
            container.scope(named("TScope")) { scope in
                scope.scoped { ShowDog(name: "Firulais", medal: 0, hairstyle: "") }
            }
        }
        SwinManager.modules(testModule)
        SwinManager.start()
        let scope: RetainedScope = RetainedScope(name: "TScope")
        XCTAssertNotNil(scope)
        do {
            let petTrainer = PetTrainer()
            XCTAssertEqual(petTrainer.dog.say(), "Guau Guau Guau", "The Say() should have returned Guau Guau")
            XCTAssertEqual(petTrainer.dog.hairstyle, "", "The hairstyle should have returned Empty")
        }
        
        do {
            let beautyParlor = BeautyParlor()
            beautyParlor.make(hairstyle: "Basic II")
        }
        
        do {
            let petTrainer = PetTrainer()
            XCTAssertEqual(petTrainer.dog.hairstyle, "Basic II", "The hairstyle should have returned Basic II")
        }
    }
    
    func testInjectDog_CreatedDog_Factory_VerifyScoped() throws {
        let testModule = module { container in
            container.scope(named("TScope")) { scope in
                scope.scoped { ShowDog(name: "Firulais", medal: 0, hairstyle: "") }
            }
        }
        SwinManager.modules(testModule)
        SwinManager.start()
        
        do {
            let scope: RetainedScope = RetainedScope(name: "TScope")
            XCTAssertNotNil(scope)
            do {
                let petTrainer = PetTrainer()
                XCTAssertEqual(petTrainer.dog.say(), "Guau Guau Guau", "The Say() should have returned Guau Guau")
                XCTAssertEqual(petTrainer.dog.hairstyle, "", "The hairstyle should have returned Empty")
            }
            
            do {
                let beautyParlor = BeautyParlor()
                beautyParlor.make(hairstyle: "Basic II")
            }
            
            do {
                let petTrainer = PetTrainer()
                XCTAssertEqual(petTrainer.dog.hairstyle, "Basic II", "The hairstyle should have returned Basic II")
            }
        }
        
        do {
            let petTrainer = PetTrainer()
            XCTAssertEqual(petTrainer.dog.say(), "Guau Guau Guau", "The Say() should have returned Guau Guau")
            XCTAssertNotEqual(petTrainer.dog.hairstyle, "Basic II", "The hairstyle should have returned Basic II")
        }
    }
    
    func testInjectDog_CreatedDog_Factory_VerifyClean() throws {
        let testModule = module { container in
            container.scope(named("TScope")) { scope in
                scope.scoped { ShowDog(name: "Firulais", medal: 0, hairstyle: "") }
            }
        }
        SwinManager.modules(testModule)
        SwinManager.start()
        let scope: RetainedScope = RetainedScope(name: "TScope")
        XCTAssertNotNil(scope)
        do {
            let petTrainer = PetTrainer()
            XCTAssertEqual(petTrainer.dog.say(), "Guau Guau Guau", "The Say() should have returned Guau Guau")
            XCTAssertEqual(petTrainer.dog.hairstyle, "", "The hairstyle should have returned Empty")
        }
        
        do {
            let beautyParlor = BeautyParlor()
            beautyParlor.make(hairstyle: "Basic II")
        }
        
        do {
            let petTrainer = PetTrainer()
            XCTAssertEqual(petTrainer.dog.hairstyle, "Basic II", "The hairstyle should have returned Basic II")
        }
        scope.cleanScope()
        
        do {
            let petTrainer = PetTrainer()
            XCTAssertEqual(petTrainer.dog.say(), "Guau Guau Guau", "The Say() should have returned Guau Guau")
            XCTAssertNotEqual(petTrainer.dog.hairstyle, "Basic II", "The hairstyle should have returned Basic II")
        }
    }
    
    func testInjectDog_CreatedDog_Factory_VerifyScopedZoo() throws {
        let testModule = module { container in
            container.scope(named("zooScope")) { scope in
                scope.scoped { Tiger(name: "Tiger") }
            }
        }
        SwinManager.modules(testModule)
        SwinManager.start()
        
        do {
            let zoo = Zoo(name: "Public Zoo")
            XCTAssertNotNil(zoo)
            
            XCTAssertEqual(zoo.tiger.say(), "Grrr Grrr", "The Say() should have returned Grrr Grrr")
            
            let guardOneZoo = GuardZoo()
            XCTAssertEqual(guardOneZoo.tiger.say(), "Grrr Grrr", "The Say() should have returned Grrr Grrr")
            XCTAssertEqual(guardOneZoo.tiger.name, "Tiger", "The name should have returned Blade")
            guardOneZoo.tiger.name = "Blade"
            
            let guardTwoZoo = GuardZoo()
            XCTAssertEqual(guardTwoZoo.tiger.name, "Blade", "The name should have returned Blade")
            
        }
        
        do {
            let zoo = Zoo(name: "Private Zoo")
            XCTAssertNotNil(zoo)
            
            let guardOneZoo = GuardZoo()
            XCTAssertEqual(guardOneZoo.tiger.say(), "Grrr Grrr", "The Say() should have returned Grrr Grrr")
            XCTAssertEqual(guardOneZoo.tiger.name, "Tiger", "The name should have returned Blade")
        }
    }
}
