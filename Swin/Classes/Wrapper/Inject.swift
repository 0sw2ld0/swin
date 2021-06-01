//
//  Inject.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

import Foundation

@propertyWrapper
public struct Inject<T> {
    public var wrappedValue: T
    
    public init() {
        self.wrappedValue = DependencyContainer.resolve()
    }
}
