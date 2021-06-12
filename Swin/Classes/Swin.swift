//
//  SwinStart.swift
//  Swin
//
//  Created by Oswaldo Leon on 5/31/21.
//

public class Swin {
    private var modules: [Module]
    private static var shared = Swin()

    private init() {
        modules = []
    }
    
    private func modules(_ modules: [Module]) {
        self.modules = modules
    }
    
    private func start() {
        modules.forEach { $0.run() }
    }
    
    private func stop() {
        DependencyContainer.clear()
    }
    
    public static func modules(_ args: Module...) {
        shared.modules(args)
    }
    
    public static func start() {
        shared.start()
    }
    
    static func stop() {
        shared.stop()
    }
}


