//
//  DependencyContainerProxyTests.swift
//  Swin
//
//  Created by Oswaldo Leon on 6/12/21.
//
import XCTest
@testable import Swin

class DependencyContainerProxyTests: XCTestCase {
    var dependencyContainerProxy: DependencyContainerProxy!
    
    override func setUp() {
        dependencyContainerProxy = DependencyContainerProxy(container: DependencyContainer.shared)
    }

    override func tearDown() {
        dependencyContainerProxy.clean()
    }
        
    func testDependencyContainerProxy_WhenCreatedDog_Factory_VerifySay() throws {
        
        dependencyContainerProxy.factory {
            Dog(name: "Fido")
        }
        
        let dog: Dog = dependencyContainerProxy.get()
        XCTAssertEqual(dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
        
    func testDependencyContainerProxy_WhenCreatedDog_Factory_Optional_VerifySay() throws {
        
        dependencyContainerProxy.factory {
            Dog(name: "Fido")
        }
        
        let dog: Dog? = dependencyContainerProxy.get()
        XCTAssertEqual(dog?.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainerProxy_WhenCreatedDog_Factory_WithNamed_VerifySay() throws {
        dependencyContainerProxy.factory(named("Pet")) {
            Dog(name: "Fido")
        }
        
        let dog: Dog = dependencyContainerProxy.get(named("Pet"))
        XCTAssertEqual(dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
        
    func testDependencyContainerProxy_WhenCreatedDog_Single_VerifySay() throws {
        
        dependencyContainerProxy.single {
            Dog(name: "Fido")
        }
        
        let dog: Dog = dependencyContainerProxy.get()
        XCTAssertEqual(dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainerProxy_WhenCreatedDog_Single_Optional_VerifySay() throws {
        
        dependencyContainerProxy.single {
            Dog(name: "Fido")
        }
        
        let dog: Dog? = dependencyContainerProxy.get()
        XCTAssertEqual(dog?.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testDependencyContainerProxy_WhenCreatedDog_Single_WithNamed_VerifySay() throws {
        dependencyContainerProxy.single(named("Pet")) {
            Dog(name: "Fido")
        }
        
        let dog: Dog = dependencyContainerProxy.get(named("Pet"))
        XCTAssertEqual(dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
}
