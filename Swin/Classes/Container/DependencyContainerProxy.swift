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
    
    public func single<T> (definition: @escaping Definition<T>) {
        
        container.registerSingle(definition)
    }
    
    public func factory<T> (definition: @escaping Definition<T>) {
        
        container.registerFactory(definition)
    }
    
    public func get<T>() -> T {
        return container.resolve()
    }

}
