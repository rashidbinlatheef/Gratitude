// Generated using Sourcery 1.8.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable all

import UIKit
@testable import Gratitude

class HomeViewControllerBuildingMock: HomeViewControllerBuilding {

    //MARK: - buildVisionBoardView

    var buildVisionBoardViewSceneDelegateVisionBoardCallsCount = 0
    var buildVisionBoardViewSceneDelegateVisionBoardCalled: Bool {
        return buildVisionBoardViewSceneDelegateVisionBoardCallsCount > 0
    }
    var buildVisionBoardViewSceneDelegateVisionBoardReceivedArguments: (sceneDelegate: VisionBoardSceneDelegate, visionBoard: VisionBoard)?
    var buildVisionBoardViewSceneDelegateVisionBoardReceivedInvocations: [(sceneDelegate: VisionBoardSceneDelegate, visionBoard: VisionBoard)] = []
    var buildVisionBoardViewSceneDelegateVisionBoardReturnValue: UIViewController!
    var buildVisionBoardViewSceneDelegateVisionBoardClosure: ((VisionBoardSceneDelegate, VisionBoard) -> UIViewController)?

    func buildVisionBoardView(sceneDelegate: VisionBoardSceneDelegate, visionBoard: VisionBoard) -> UIViewController {
        buildVisionBoardViewSceneDelegateVisionBoardCallsCount += 1
        buildVisionBoardViewSceneDelegateVisionBoardReceivedArguments = (sceneDelegate: sceneDelegate, visionBoard: visionBoard)
        buildVisionBoardViewSceneDelegateVisionBoardReceivedInvocations.append((sceneDelegate: sceneDelegate, visionBoard: visionBoard))
        return buildVisionBoardViewSceneDelegateVisionBoardClosure.map({ $0(sceneDelegate, visionBoard) }) ?? buildVisionBoardViewSceneDelegateVisionBoardReturnValue
    }

    //MARK: - buildSectionDetailsView

    var buildSectionDetailsViewSceneDelegateSectionImagesCallsCount = 0
    var buildSectionDetailsViewSceneDelegateSectionImagesCalled: Bool {
        return buildSectionDetailsViewSceneDelegateSectionImagesCallsCount > 0
    }
    var buildSectionDetailsViewSceneDelegateSectionImagesReceivedArguments: (sceneDelegate: SectionDetailsSceneDelegate, section: Section, images: [ImagePickerItem])?
    var buildSectionDetailsViewSceneDelegateSectionImagesReceivedInvocations: [(sceneDelegate: SectionDetailsSceneDelegate, section: Section, images: [ImagePickerItem])] = []
    var buildSectionDetailsViewSceneDelegateSectionImagesReturnValue: UIViewController!
    var buildSectionDetailsViewSceneDelegateSectionImagesClosure: ((SectionDetailsSceneDelegate, Section, [ImagePickerItem]) -> UIViewController)?

    func buildSectionDetailsView(sceneDelegate: SectionDetailsSceneDelegate, section: Section, images: [ImagePickerItem]) -> UIViewController {
        buildSectionDetailsViewSceneDelegateSectionImagesCallsCount += 1
        buildSectionDetailsViewSceneDelegateSectionImagesReceivedArguments = (sceneDelegate: sceneDelegate, section: section, images: images)
        buildSectionDetailsViewSceneDelegateSectionImagesReceivedInvocations.append((sceneDelegate: sceneDelegate, section: section, images: images))
        return buildSectionDetailsViewSceneDelegateSectionImagesClosure.map({ $0(sceneDelegate, section, images) }) ?? buildSectionDetailsViewSceneDelegateSectionImagesReturnValue
    }

    //MARK: - buildSectionImageSelectorView

    var buildSectionImageSelectorViewSceneDelegateSectionCallsCount = 0
    var buildSectionImageSelectorViewSceneDelegateSectionCalled: Bool {
        return buildSectionImageSelectorViewSceneDelegateSectionCallsCount > 0
    }
    var buildSectionImageSelectorViewSceneDelegateSectionReceivedArguments: (sceneDelegate: SectionImageSelectorSceneDelegate, section: Section)?
    var buildSectionImageSelectorViewSceneDelegateSectionReceivedInvocations: [(sceneDelegate: SectionImageSelectorSceneDelegate, section: Section)] = []
    var buildSectionImageSelectorViewSceneDelegateSectionReturnValue: UIViewController!
    var buildSectionImageSelectorViewSceneDelegateSectionClosure: ((SectionImageSelectorSceneDelegate, Section) -> UIViewController)?

    func buildSectionImageSelectorView(sceneDelegate: SectionImageSelectorSceneDelegate, section: Section) -> UIViewController {
        buildSectionImageSelectorViewSceneDelegateSectionCallsCount += 1
        buildSectionImageSelectorViewSceneDelegateSectionReceivedArguments = (sceneDelegate: sceneDelegate, section: section)
        buildSectionImageSelectorViewSceneDelegateSectionReceivedInvocations.append((sceneDelegate: sceneDelegate, section: section))
        return buildSectionImageSelectorViewSceneDelegateSectionClosure.map({ $0(sceneDelegate, section) }) ?? buildSectionImageSelectorViewSceneDelegateSectionReturnValue
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
