// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class UserNameInputInteractingMock: UserNameInputInteracting {

    //MARK: - handleContinueButtonWithName

    var handleContinueButtonWithNameCallsCount = 0
    var handleContinueButtonWithNameCalled: Bool {
        return handleContinueButtonWithNameCallsCount > 0
    }
    var handleContinueButtonWithNameReceivedName: String?
    var handleContinueButtonWithNameReceivedInvocations: [String] = []
    var handleContinueButtonWithNameClosure: ((String) -> Void)?

    func handleContinueButtonWithName(_ name: String) {
        handleContinueButtonWithNameCallsCount += 1
        handleContinueButtonWithNameReceivedName = name
        handleContinueButtonWithNameReceivedInvocations.append(name)
        handleContinueButtonWithNameClosure?(name)
    }

}

// swiftlint:disable all

import UIKit
@testable import Gratitude

class UsernameInputSceneDelegateMock: UsernameInputSceneDelegate {

    //MARK: - continueWithUsername

    var continueWithUsernameCallsCount = 0
    var continueWithUsernameCalled: Bool {
        return continueWithUsernameCallsCount > 0
    }
    var continueWithUsernameReceivedName: String?
    var continueWithUsernameReceivedInvocations: [String] = []
    var continueWithUsernameClosure: ((String) -> Void)?

    func continueWithUsername(_ name: String) {
        continueWithUsernameCallsCount += 1
        continueWithUsernameReceivedName = name
        continueWithUsernameReceivedInvocations.append(name)
        continueWithUsernameClosure?(name)
    }

}
