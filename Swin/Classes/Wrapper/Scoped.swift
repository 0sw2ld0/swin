//
//  Inject.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

import Foundation

@propertyWrapper
public struct Scoped<T: AnyObject> {
    
    public var wrappedValue: T

    public init(_ scopeName: String) {
        let scopeQualifier = StringQualifier(value: scopeName)
        self.wrappedValue = DependencyContainer.resolveScope(scopeQualifier)
    }
}
