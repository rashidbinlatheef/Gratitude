//
//  BaseCoordinator.swift
//  Gratitude
//
//  Created by Muhammed Rashid on 08/09/22.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }
}
