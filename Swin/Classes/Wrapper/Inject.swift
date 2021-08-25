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

    public init(named: String? = nil) {
        var qualifier: Qualifier?
        if let named = named {
            qualifier = StringQualifier(value: named)
        }
        
        self.wrappedValue = DependencyContainer.resolve(qualifier)
    }
}
