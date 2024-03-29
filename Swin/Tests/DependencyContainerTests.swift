//
//  DependencyContainerTests.swift
//  Swin
//
//  Created by Oswaldo Leon on 6/12/21.
//
import XCTest
@testable import Swin

class DependencyContainerTests: XCTestCase {
    
    override func setUp() {

    }

    override func tearDown() {
        DependencyContainer.clean()
    }
    
    func testDependencyContainer_KeyName() throws {
        XCTAssertEqual(keyName("Dog"), "Dog", "Same name")
    }
    
    func testDependencyContainer_KeyName_Optional() throws {
        XCTAssertEqual(keyName("Optional<Dog>"), "Dog", "Same name")
    }
    
    func testDependencyContainer_KeyName_WithNamed() throws {
        XCTAssertEqual(keyName("Dog", named("Pet")), "Dog::Pet", "Same name")
    }
    
    func testDependencyContainer_KeyName_Optional_WithNamed() throws {
        XCTAssertEqual(keyName("Optional<Dog>", named("Pet")), "Dog::Pet", "Same name")
    }
    
    func testDependencyContainer_WhenNotCreatedDog_HasRequiredEmpty() throws {
        XCTAssertFalse(DependencyContainer.shared.keysFromDependencies()
                        .contains("Dog"), "The keysFromDependencies() should have not returned Dog for the name class")
    }
    
    func testDependencyContainer_WhenCreatedDog_Factory_HasRequiredNotEmpty() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerFactory { dog }
        XCTAssertTrue(DependencyContainer.shared.keysFromDependencies()
                        .contains("Dog"), "The keysFromDependencies() should have returned Dog for the name class")
    }
    
    func testDependencyContainer_WhenCreatedDog_Single_HasRequiredNotEmpty() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerSingle { dog }
        XCTAssertTrue(DependencyContainer.shared.keysFromDependencies()
                        .contains("Dog"), "The keysFromDependencies() should have returned Dog for the name class")
    }
    
    func testDependencyContainer_WhenCreatedDog_Factory_WithNamed_HasRequiredNotEmpty() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerFactory(named("Pet")) { dog }
        XCTAssertTrue(DependencyContainer.shared.keysFromDependencies()
                        .contains("Dog::Pet"), "The keysFromDependencies() should have returned Dog for the name class")
    }
    
    func testDependencyContainer_WhenCreatedDog_Single_WithNamed_HasRequiredNotEmpty() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerSingle(named("Pet")) { dog }
        XCTAssertTrue(DependencyContainer.shared.keysFromDependencies()
                        .contains("Dog::Pet"), "The keysFromDependencies() should have returned Dog for the name class")
    }
    
    func testDependencyContainer_WhenNotCreatedDog_PreconditionFail() {
        XCTAssertPrecondition(expectedMessage: "No dependency found for Dog must register a dependency before resolve or inject.") {
            let key = keyName(String(describing: Dog.self))
            let _: Dog? = DependencyContainer.shared.searchValue(key)
        }
    }
    
    func testDependencyContainer_WhenNotCreatedDog_WithNamed_PreconditionFail() {
        XCTAssertPrecondition(expectedMessage: "No dependency found for Dog::Pet must register a dependency before resolve or inject.") {
            let key = keyName(String(describing: Dog.self), named("Pet"))
            let _: Dog? = DependencyContainer.shared.searchValue(key)
        }
    }
    
    func testDependencyContainer_WhenCreatedDog_Factory_VerifySay() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerFactory { dog }
        
        let object: Dog = DependencyContainer.resolve()
        XCTAssertEqual(object.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainer_WhenCreatedDog_Factory_Optional_VerifySay() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerFactory { dog }
        
        let object: Dog? = DependencyContainer.resolve()
        XCTAssertEqual(object?.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainer_WhenCreatedDog_Single_VerifySay() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerSingle { dog }
        
        let object: Dog = DependencyContainer.resolve()
        XCTAssertEqual(object.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainer_WhenCreatedDogs_Single_VerifySay() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerSingle { dog }
        
        let objectOne: Dog = DependencyContainer.resolve()
        XCTAssertEqual(objectOne.say(), "Guau Guau", "The Say() should have returned Guau Guau")
        
        let objectTwo: Dog = DependencyContainer.resolve()
        XCTAssertEqual(objectTwo.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainer_WhenCreatedDog_Single_Optional_VerifySay() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerSingle { dog }
        
        let object: Dog? = DependencyContainer.resolve()
        XCTAssertEqual(object?.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainer_WhenCreatedDog_Factory_WithNamed_VerifySay() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerFactory(named("Pet")) { dog }

        let object: Dog = DependencyContainer.resolve(named("Pet"))
        XCTAssertEqual(object.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainer_WhenCreatedDog_Factory_Optional_WithNamed_VerifySay() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerFactory(named("Pet")) { dog }

        let object: Dog? = DependencyContainer.resolve(named("Pet"))
        XCTAssertEqual(object?.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainer_WhenCreatedDog_Single_WithNamed_VerifySay() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerSingle(named("Pet")) { dog }

        let object: Dog = DependencyContainer.resolve(named("Pet"))
        XCTAssertEqual(object.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainer_WhenCreatedDog_Single_Optional_WithNamed_VerifySay() throws {
        let dog = Dog(name: "Fido")
        DependencyContainer.shared.registerSingle(named("Pet")) { dog }

        let object: Dog? = DependencyContainer.resolve(named("Pet"))
        XCTAssertEqual(object?.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
}
