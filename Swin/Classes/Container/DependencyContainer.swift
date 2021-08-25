//
//  DependencyContainer.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public final class DependencyContainer {
    
    static var shared = DependencyContainer()

    private var dependencies = [String: BaseInstanceFactory<Any>]()

    public static func resolve<T>(_ qualifier: Qualifier? = nil) -> T {
        shared.resolve(qualifier)
    }
    
    public static func resolveScope<T>(_ qualifier: Qualifier) -> T {
        return shared.resolveScope(qualifier)
    }
    
    static func clean() {
        shared.clean()
    }
    
    func keysFromDependencies() -> [String] {
        return dependencies.keys.map { $0 }
    }
            
    func registerSingle<T>(moduleId: String = "", _ qualifier: Qualifier? = nil, _ dependency: @escaping Definition<T>) {
        let key = keyName(String(describing: T.self), qualifier)
        let instanceFactory = SingleInstanceFactory(moduleId: moduleId, definition: dependency) as BaseInstanceFactory<Any>
        dependencies[key] = instanceFactory
    }
    
    func registerFactory<T>(moduleId: String = "", _ qualifier: Qualifier? = nil, _ dependency: @escaping Definition<T>) {
        let key = keyName(String(describing: T.self), qualifier)
        let instanceFactory = FactoryInstanceFactory(moduleId: moduleId, definition: dependency) as BaseInstanceFactory<Any>
        dependencies[key] = instanceFactory
    }
    
    func registerScoped(moduleId: String = "", _ qualifier: Qualifier? = nil, _ dependency: @escaping Definition<Scope>) {
        let key = keyName(String(describing: Scope.self), qualifier)
        let instanceFactory = ScopedInstanceFactory(moduleId: moduleId, definition: dependency) as BaseInstanceFactory<Any>
        dependencies[key] = instanceFactory
    }

    func resolve<T>(_ qualifier: Qualifier? = nil) -> T {
        let key = keyName(String(describing: T.self), qualifier)
        return searchValue(key)!
    }
    
    func resolveScope<T>(_ qualifier: Qualifier) -> T {
        let key = keyName(String(describing: Scope.self), qualifier)
        return searchValue(key)!
    }
        
    func searchValue<T>(_ key: String) -> T? {
        let dependency = dependencies[key]
        precondition(dependency != nil, "No dependency found for \(key) must register a dependency before resolve or inject.")
        
        return dependency?.get()
    }
    
    func removeModule(_ moduleId: String) {
        dependencies
            .filter { $1.moduleId == moduleId }
            .map { $0.key }
            .forEach { dependencies.removeValue(forKey: $0) }
    }
    
    func cleanScope(_ qualifier: Qualifier) {
        let key = keyName(String(describing: Scope.self), qualifier)
        let dependency = dependencies[key] as? ScopedInstanceFactory
        dependency?.clean()
    }
    
    func clean() {
        dependencies.removeAll()
    }
}

internal func keyName(_ key: String, _ qualifier: Qualifier? = nil) -> String {
    var name = key
    if name.hasPrefix("Optional<") && name.hasSuffix(">") {
        name = String(name.suffix(name.count - "Optional<".count))
        name = String(name.prefix(name.count - ">".count))
    }
    
    if let qualifier = qualifier {
        name.append("::\(qualifier.value)")
    }
    
    return name
}
