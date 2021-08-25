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
        DependencyContainer.clean()
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
    
    func testRegisterModule_CreatedPetOwner_CreatedDog_Single_VerifyRemove() throws {
    
        let testModule = module { container in
            container.factory { Dog(name: "Fido") as Animal}
            container.factory { PetOwner()}
            container.factory { PetTeam()}
        }
        
        testModule.run()
      
        do {
            let petTeam: PetTeam = DependencyContainer.resolve()
            
            XCTAssertEqual(petTeam.petOwner.dog.say(), "Guau Guau", "The Say() should have returned Guau Guau")
        }
        
        testModule.remove()
        
        do {
            XCTAssertPrecondition(expectedMessage: "No dependency found for PetTeam must register a dependency before resolve or inject.") {
                let key = keyName(String(describing: PetTeam.self))
                let petTeam: PetTeam? =  DependencyContainer.shared.searchValue(key)
                XCTAssertNil(petTeam)
            }
            
            XCTAssertPrecondition(expectedMessage: "No dependency found for PetOwner must register a dependency before resolve or inject.") {
                let key = keyName(String(describing: PetOwner.self))
                let petOwner: PetOwner? =  DependencyContainer.shared.searchValue(key)
                XCTAssertNil(petOwner)
            }
            
            XCTAssertPrecondition(expectedMessage: "No dependency found for Animal must register a dependency before resolve or inject.") {
                let key = keyName(String(describing: Animal.self))
                let animal: Animal? =  DependencyContainer.shared.searchValue(key)
                XCTAssertNil(animal)
            }
        }
    }
}
