//
//  DependencyContainerProxy.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public class DependencyContainerProxy {
    
    private let container: DependencyContainer
    private let moduleId: String
    
    init(moduleId: String = "", container: DependencyContainer) {
        self.moduleId = moduleId
        self.container = container
    }
    
    public func single<T> (_ qualifier: Qualifier? = nil, definition: @escaping Definition<T>) {
        container.registerSingle(moduleId: moduleId, qualifier, definition)
    }
    
    public func factory<T> (_ qualifier: Qualifier? = nil, definition: @escaping Definition<T>) {
        container.registerFactory(moduleId: moduleId, qualifier, definition)
    }
    
    public func scope(_ qualifier: Qualifier, scopeBody: @escaping (Scope) -> Void) {
        let definition: () -> Scope = {
            let mScoped = Scope(qualifier: qualifier)
            scopeBody(mScoped)
            return mScoped
        }
        container.registerScoped(moduleId: moduleId, qualifier, definition)
    }
    
    public func get<T>(_ qualifier: Qualifier? = nil) -> T {
        return container.resolve(qualifier)
    }
    
    internal func clean () {
        container.clean()
    }
}
