// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class CoordinatorMock: Coordinator {
    var childCoordinators: [Coordinator] = []

    //MARK: - start

    var startCallsCount = 0
    var startCalled: Bool {
        return startCallsCount > 0
    }
    var startClosure: (() -> Void)?

    func start() {
        startCallsCount += 1
        startClosure?()
    }

    //MARK: - addChildCoordinartor

    var addChildCoordinartorCallsCount = 0
    var addChildCoordinartorCalled: Bool {
        return addChildCoordinartorCallsCount > 0
    }
    var addChildCoordinartorReceivedCoordinator: Coordinator?
    var addChildCoordinartorReceivedInvocations: [Coordinator] = []
    var addChildCoordinartorClosure: ((Coordinator) -> Void)?

    func addChildCoordinartor(_ coordinator: Coordinator) {
        addChildCoordinartorCallsCount += 1
        addChildCoordinartorReceivedCoordinator = coordinator
        addChildCoordinartorReceivedInvocations.append(coordinator)
        addChildCoordinartorClosure?(coordinator)
    }

    //MARK: - removeChildCoordinators

    var removeChildCoordinatorsCallsCount = 0
    var removeChildCoordinatorsCalled: Bool {
        return removeChildCoordinatorsCallsCount > 0
    }
    var removeChildCoordinatorsClosure: (() -> Void)?

    func removeChildCoordinators() {
        removeChildCoordinatorsCallsCount += 1
        removeChildCoordinatorsClosure?()
    }

    //MARK: - removeChildCoordinator

    var removeChildCoordinatorCallsCount = 0
    var removeChildCoordinatorCalled: Bool {
        return removeChildCoordinatorCallsCount > 0
    }
    var removeChildCoordinatorReceivedCoordinator: Coordinator?
    var removeChildCoordinatorReceivedInvocations: [Coordinator] = []
    var removeChildCoordinatorClosure: ((Coordinator) -> Void)?

    func removeChildCoordinator(_ coordinator: Coordinator) {
        removeChildCoordinatorCallsCount += 1
        removeChildCoordinatorReceivedCoordinator = coordinator
        removeChildCoordinatorReceivedInvocations.append(coordinator)
        removeChildCoordinatorClosure?(coordinator)
    }

}
