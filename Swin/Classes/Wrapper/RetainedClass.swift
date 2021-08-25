//
//  Scope.swift
//  Swin
//
//  Created by Oswaldo Leon on 6/14/21.
//

import Foundation

@propertyWrapper
public struct RetainedClass<Value: RetainedScope> {
    
    public var wrappedValue: RetainedScope

    public init(_ scope: String) {
        print(scope)
        self.wrappedValue = RetainedScope(name: scope)
        
    }
}
