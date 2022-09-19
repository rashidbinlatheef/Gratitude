//
//  Coordinator.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 08/09/22.
//

import Foundation

//sourcery: AutoMockable
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
    func addChildCoordinartor(_ coordinator: Coordinator)
    func removeChildCoordinators()
    func removeChildCoordinator(_ coordinator: Coordinator)
}

extension Coordinator {
    func addChildCoordinartor(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinators() {
        childCoordinators.forEach { $0.removeChildCoordinators() }
        childCoordinators.removeAll()
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            coordinator.removeChildCoordinators()
            childCoordinators.remove(at: index)
        }
    }
}
