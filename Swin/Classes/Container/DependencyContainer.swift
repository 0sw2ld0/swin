//
//  DependencyContainer.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

import Foundation

public final class DependencyContainer {
    static var shared = DependencyContainer()

    private var dependencies = [String: BaseInstanceFactory<Any>]()

    public static func resolve<T>() -> T {
        shared.resolve()
    }
            
    func registerSingle<T>(_ dependency: @escaping Definition<T>) {
        let key = String(describing: T.self)
        let instanceFactory = SingleInstanceFactory(definition: dependency) as BaseInstanceFactory<Any>
        dependencies[key] = instanceFactory
    }
    
    func registerFactory<T>(_ dependency: @escaping Definition<T>) {
        let key = String(describing: T.self)
        let instanceFactory = FactoryInstanceFactory(definition: dependency) as BaseInstanceFactory<Any>
        dependencies[key] = instanceFactory
    }

    func resolve<T>() -> T {
        var key = String(describing: T.self)
        if key.hasPrefix("Optional<") && key.hasSuffix(">") {
            key = String(key.suffix(key.count - "Optional<".count))
            key = String(key.prefix(key.count - ">".count))
        }
        let dependency = dependencies[key]
        
        precondition(dependency != nil, "No dependency found for \(key) must register a dependency before resolve or inject.")
        return dependency!.get() as! T
    }
}

