//
//  ScopedInstanceFactory.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

class ScopedInstanceFactory: BaseInstanceFactory<Any> {
    
    var values: [String: Any] = [:]
    
    private func isCreated(name: String) -> Bool {
        return values[name] != nil
    }
    
    private func getValue<W>() -> W? {
        let key = keyName(String(describing: W.self))
        return values[key] as? W
    }
    
    private func getScope() -> Scope? {
        return super.get()
    }

    override func get<W>() -> W? {
        let key = keyName(String(describing: W.self))
        if !isCreated(name: key) {
            guard let definition = getScope()?.definitions[key]  else {
                return nil
            }
            values[key] = create(definition)
        }
        return getValue()
    }
    
    public func clean() {
        values.removeAll()
    }
}
