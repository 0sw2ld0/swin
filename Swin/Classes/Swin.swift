//
//  SwinStart.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public class Swin {
    
    var modules: [Module]
    static var shared = Swin()

    private init() {
        modules = []
    }
    
    private func modules(_ modules: [Module]) {
        self.modules = modules
    }
    
    private func add(module: Module) {
        modules.append(module)
    }
    
    private func start() {
        modules.forEach { $0.run() }
    }
    
    private func stop() {
        DependencyContainer.clean()
    }
    
    private func remove(module: Module) {
        let index = modules.firstIndex { $0 == module}
        guard let indexModule = index else {
            return
        }
        modules.remove(at: indexModule)
    }
    
    public static func modules(_ args: Module...) {
        shared.modules(args)
    }
    
    public static func add(module: Module) {
        shared.add(module: module)
    }
    
    public static func remove(module: Module) {
        shared.remove(module: module)
    }
    
    public static func start() {
        shared.start()
    }
    
    public static func stop() {
        shared.stop()
    }
}
