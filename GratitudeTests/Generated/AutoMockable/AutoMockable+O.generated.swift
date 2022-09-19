// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class OnboardingViewControllerBuildingMock: OnboardingViewControllerBuilding {

    //MARK: - buildIntroductionView

    var buildIntroductionViewSceneDelegateCallsCount = 0
    var buildIntroductionViewSceneDelegateCalled: Bool {
        return buildIntroductionViewSceneDelegateCallsCount > 0
    }
    var buildIntroductionViewSceneDelegateReceivedSceneDelegate: IntroductionSceneDelegate?
    var buildIntroductionViewSceneDelegateReceivedInvocations: [IntroductionSceneDelegate] = []
    var buildIntroductionViewSceneDelegateReturnValue: UIViewController!
    var buildIntroductionViewSceneDelegateClosure: ((IntroductionSceneDelegate) -> UIViewController)?

    func buildIntroductionView(sceneDelegate: IntroductionSceneDelegate) -> UIViewController {
        buildIntroductionViewSceneDelegateCallsCount += 1
        buildIntroductionViewSceneDelegateReceivedSceneDelegate = sceneDelegate
        buildIntroductionViewSceneDelegateReceivedInvocations.append(sceneDelegate)
        return buildIntroductionViewSceneDelegateClosure.map({ $0(sceneDelegate) }) ?? buildIntroductionViewSceneDelegateReturnValue
    }

    //MARK: - buildUserNameInputView

    var buildUserNameInputViewSceneDelegateCallsCount = 0
    var buildUserNameInputViewSceneDelegateCalled: Bool {
        return buildUserNameInputViewSceneDelegateCallsCount > 0
    }
    var buildUserNameInputViewSceneDelegateReceivedSceneDelegate: UsernameInputSceneDelegate?
    var buildUserNameInputViewSceneDelegateReceivedInvocations: [UsernameInputSceneDelegate] = []
    var buildUserNameInputViewSceneDelegateReturnValue: UIViewController!
    var buildUserNameInputViewSceneDelegateClosure: ((UsernameInputSceneDelegate) -> UIViewController)?

    func buildUserNameInputView(sceneDelegate: UsernameInputSceneDelegate) -> UIViewController {
        buildUserNameInputViewSceneDelegateCallsCount += 1
        buildUserNameInputViewSceneDelegateReceivedSceneDelegate = sceneDelegate
        buildUserNameInputViewSceneDelegateReceivedInvocations.append(sceneDelegate)
        return buildUserNameInputViewSceneDelegateClosure.map({ $0(sceneDelegate) }) ?? buildUserNameInputViewSceneDelegateReturnValue
    }

    //MARK: - buildVisionBoardNameInputView

    var buildVisionBoardNameInputViewUserNameSceneDelegateCallsCount = 0
    var buildVisionBoardNameInputViewUserNameSceneDelegateCalled: Bool {
        return buildVisionBoardNameInputViewUserNameSceneDelegateCallsCount > 0
    }
    var buildVisionBoardNameInputViewUserNameSceneDelegateReceivedArguments: (userName: String, sceneDelegate: VisionBoardNameInputSceneDelegate)?
    var buildVisionBoardNameInputViewUserNameSceneDelegateReceivedInvocations: [(userName: String, sceneDelegate: VisionBoardNameInputSceneDelegate)] = []
    var buildVisionBoardNameInputViewUserNameSceneDelegateReturnValue: UIViewController!
    var buildVisionBoardNameInputViewUserNameSceneDelegateClosure: ((String, VisionBoardNameInputSceneDelegate) -> UIViewController)?

    func buildVisionBoardNameInputView(userName: String, sceneDelegate: VisionBoardNameInputSceneDelegate) -> UIViewController {
        buildVisionBoardNameInputViewUserNameSceneDelegateCallsCount += 1
        buildVisionBoardNameInputViewUserNameSceneDelegateReceivedArguments = (userName: userName, sceneDelegate: sceneDelegate)
        buildVisionBoardNameInputViewUserNameSceneDelegateReceivedInvocations.append((userName: userName, sceneDelegate: sceneDelegate))
        return buildVisionBoardNameInputViewUserNameSceneDelegateClosure.map({ $0(userName, sceneDelegate) }) ?? buildVisionBoardNameInputViewUserNameSceneDelegateReturnValue
    }

    //MARK: - buildSectionNameInputView

    var buildSectionNameInputViewSceneDelegateCallsCount = 0
    var buildSectionNameInputViewSceneDelegateCalled: Bool {
        return buildSectionNameInputViewSceneDelegateCallsCount > 0
    }
    var buildSectionNameInputViewSceneDelegateReceivedSceneDelegate: SectionNameInputSceneDelegate?
    var buildSectionNameInputViewSceneDelegateReceivedInvocations: [SectionNameInputSceneDelegate] = []
    var buildSectionNameInputViewSceneDelegateReturnValue: UIViewController!
    var buildSectionNameInputViewSceneDelegateClosure: ((SectionNameInputSceneDelegate) -> UIViewController)?

    func buildSectionNameInputView(sceneDelegate: SectionNameInputSceneDelegate) -> UIViewController {
        buildSectionNameInputViewSceneDelegateCallsCount += 1
        buildSectionNameInputViewSceneDelegateReceivedSceneDelegate = sceneDelegate
        buildSectionNameInputViewSceneDelegateReceivedInvocations.append(sceneDelegate)
        return buildSectionNameInputViewSceneDelegateClosure.map({ $0(sceneDelegate) }) ?? buildSectionNameInputViewSceneDelegateReturnValue
    }

}
