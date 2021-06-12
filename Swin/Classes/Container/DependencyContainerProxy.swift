//
//  DependencyContainerProxy.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

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
    
    internal func clear () {
        return container.clear()
    }
}
