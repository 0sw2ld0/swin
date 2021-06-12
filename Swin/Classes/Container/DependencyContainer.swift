//
//  DependencyContainer.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public final class DependencyContainer {
    static var shared = DependencyContainer()

    private var dependencies = [String: BaseInstanceFactory<Any>]()

    public static func resolve<T>(_ qualifier:Qualifier? = nil) -> T {
        shared.resolve(qualifier)
    }
    
    static func clear() {
        shared.clear()
    }
    
    func keysFromDependencies() -> [String]{
        return dependencies.keys.map { $0 }
    }
            
    func registerSingle<T>(_ qualifier:Qualifier? = nil, _ dependency: @escaping Definition<T>) {
        let key = keyName(String(describing: T.self), qualifier)
        let instanceFactory = SingleInstanceFactory(definition: dependency) as BaseInstanceFactory<Any>
        dependencies[key] = instanceFactory
    }
    
    func registerFactory<T>(_ qualifier:Qualifier? = nil, _ dependency: @escaping Definition<T>) {
        let key = keyName(String(describing: T.self), qualifier)
        let instanceFactory = FactoryInstanceFactory(definition: dependency) as BaseInstanceFactory<Any>
        dependencies[key] = instanceFactory
    }

    func resolve<T>(_ qualifier:Qualifier? = nil) -> T {        
        return searchValue(qualifier)!
    }
        
    func searchValue<T>(_ qualifier:Qualifier? = nil) -> T? {
        let key = keyName(String(describing: T.self), qualifier)
        let dependency = dependencies[key]
        
        precondition(dependency != nil, "No dependency found for \(key) must register a dependency before resolve or inject.")
        
        return dependency?.get() as? T
    }
    
    func clear() {
        dependencies.removeAll()
    }
    
    internal func keyName(_ key: String, _ qualifier:Qualifier? = nil) -> String{
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
}

