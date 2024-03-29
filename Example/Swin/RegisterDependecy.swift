//
//  RegisterDependecy.swift
//  Swin_Example
//
//  Created by Oswaldo Leon on 5/31/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Swin

var nameFavoritePet = "Michi"

public let demoModule = module { container in
    container.factory { Dog(name: "Fido \(Int.random(in: 0...100))", age: Int.random(in: 0...100))}
    container.factory(named("MyDog")) { Dog(name: "Ruffo", age: 7)}
    container.single { Cat(name: nameFavoritePet, age: Int.random(in: 0...100))}
    container.single(named("MyCat")) { Cat(name: "Tiger", age: Int.random(in: 0...100))}
    container.single { Cat(name: "Magno", age: Int.random(in: 0...100)) as Mammal}
    container.factory { PetOwner(dog: container.get(), cat: container.get()) }
    
    container.scope(named("vcScope")) { scope in
        scope.scoped { Cat(name: "Tiger", age: 77) }
    }
}
