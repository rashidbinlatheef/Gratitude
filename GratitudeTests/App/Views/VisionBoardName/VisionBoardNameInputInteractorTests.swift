//
//  VisionBoardNameInputInteractorTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 16/09/22.
//

import XCTest
@testable import Gratitude

final class VisionBoardNameInputInteractorTests: XCTestCase {
    private var sut: VisionBoardNameInputInteractor!
    private var sceneDelegate: VisionBoardNameInputSceneDelegateMock!
    private var presenter: VisionBoardNameInputPresentingMock!
    private var userName: String!

    override func setUp() {
        super.setUp()
        sceneDelegate = VisionBoardNameInputSceneDelegateMock()
        presenter = VisionBoardNameInputPresentingMock()
        userName = "John"
        sut = VisionBoardNameInputInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter,
            userName: userName
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        sceneDelegate = nil
        presenter = nil
        userName = nil
    }
    
    func testDidLoadCallsDisplayOnPresenter() {
        // Given
        let expectedHeader = "Hello, John! 😊 👋🏽\nLet’s give your vision board a name."
        let expectedNameList = ["🕺My Dream Life", "🎯 Vision Board 2021", "💫 John’s Dream World"]
        
        // When
        sut.didLoad()
        
        // Then
        let receivedArguments = presenter.displayHeaderNameListListActionHandlerReceivedArguments
        XCTAssertTrue(presenter.displayHeaderNameListListActionHandlerCalled)
        XCTAssertEqual(presenter.displayHeaderNameListListActionHandlerCallsCount, 1)
        XCTAssertEqual(receivedArguments?.header, expectedHeader)
        XCTAssertEqual(receivedArguments?.nameList, expectedNameList)
        XCTAssertTrue(receivedArguments?.listActionHandler === sut)
    }
    
    func testHandleContinueButtonWithNameCallsSceneDelegate() {
        // Given
        let name = "My Board"
        
        // When
        sut.handleContinueButtonWithName(name)
        
        // Then
        XCTAssertTrue(sceneDelegate.continueWithVisionBoardNameCalled)
        XCTAssertEqual(sceneDelegate.continueWithVisionBoardNameCallsCount, 1)
        XCTAssertEqual(sceneDelegate.continueWithVisionBoardNameReceivedName, name)
    }
    
    func testDidSelectNameCallsPresenter() {
        // Given
        let name = "My Board"
        
        // When
        sut.didSelectName(name)
        
        // Then
        XCTAssertTrue(presenter.updateVisionBoardNameCalled)
        XCTAssertEqual(presenter.updateVisionBoardNameCallsCount, 1)
        XCTAssertEqual(presenter.updateVisionBoardNameReceivedVisionBoardName, name)
    }
}
