//
//  ModuleTests.swift
//  Swin
//
//  Created by Oswaldo Leon on 6/12/21.
//
import XCTest
@testable import Swin

class ModuleTests: XCTestCase {
    
    override func setUp() {
        
    }

    override func tearDown() {
        DependencyContainer.clear()
    }
    
    func testRegisterModule_CreatedDog_Factory_VerifySay() throws {
    
        let testModule = module { container in
            container.factory { Dog(name: "Fido")}
        }
        testModule.run()
      
        let dog: Dog = DependencyContainer.resolve()
        
        XCTAssertEqual(dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testRegisterModule_CreatedDog_Single_VerifySay() throws {
    
        let testModule = module { container in
            container.single { Dog(name: "Fido")}
        }
        testModule.run()
      
        let dog: Dog = DependencyContainer.resolve()
        
        XCTAssertEqual(dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
    
    func testRegisterModule_CreatedPetOwner_CreatedDog_Single_VerifySay() throws {
    
        let testModule = module { container in
            container.factory { Dog(name: "Fido") as Animal}
            container.factory { PetOwner()}
            container.factory { PetTeam()}
        }
        
        testModule.run()
      
        let petTeam: PetTeam = DependencyContainer.resolve()
        
        XCTAssertEqual(petTeam.petOwner.dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
    }
}
