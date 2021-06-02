//
//  DependencyContainerProxy.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

import Foundation

public class DependencyContainerProxy {
    private let container: DependencyContainer

    init(container: DependencyContainer) {
        self.container = container
    }
    
    public func single<T> (_ qualifier:Qualifier? = nil, definition: @escaping Definition<T>) {
        
        container.registerSingle(qualifier,definition)
    }
    
    public func factory<T> (_ qualifier:Qualifier? = nil, definition: @escaping Definition<T>) {
        
        container.registerFactory(qualifier, definition)
    }
    
    public func get<T>(_ qualifier:Qualifier? = nil) -> T {
        return container.resolve(qualifier)
    }
    
    public func named(_ name: String) -> Qualifier {
        return StringQualifier(value: name)
    }

}
