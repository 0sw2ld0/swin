//
//  Scope.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public class Scope {
    
    var definitions: [String: Definition<Any>] = [:]
    var qualifier: Qualifier
    
    init(qualifier: Qualifier) {
        self.qualifier = qualifier
    }
    
    public func scoped<T> (definition: @escaping Definition<T>) {
        let key = keyName(String(describing: T.self))
        definitions[key] = definition
    }
}
