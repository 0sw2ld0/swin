//
//  PetOwner.swift
//  Swin_Example
//
//  Created by Oswaldo Leon on 5/31/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import Foundation
import Swin

struct PetOwner {
    @Inject var dog: Dog
    @Inject var cat: Cat

    init(dog: Dog, cat: Cat) {
        self.dog = dog
        self.cat = cat
    }
    
    init() {}
}
