//
//  RegisterDependecy.swift
//  Swin_Example
//
//  Created by Oswaldo Leon on 5/31/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Swin

var nameFavoritePet = "Michi"

public let demoModule = module { container in
    container.factory { Dog(name: "Fido \(Int.random(in: 0...100))", age: Int.random(in: 0...100))}
    container.single { Cat(name: nameFavoritePet, age: Int.random(in: 0...100))}
    container.factory { PetOwner(dog: container.get(), cat: container.get()) }
}
