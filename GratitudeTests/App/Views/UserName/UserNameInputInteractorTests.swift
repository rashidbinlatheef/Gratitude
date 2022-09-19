//
//  UserNameInputInteractorTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

import XCTest
@testable import Gratitude

final class UserNameInputInteractorTests: XCTestCase {
    private var sut: UserNameInputInteractor!
    private var sceneDelegate: UsernameInputSceneDelegateMock!


    override func setUp() {
        super.setUp()
        sceneDelegate = UsernameInputSceneDelegateMock()
        sut = UserNameInputInteractor(
            sceneDelegate: sceneDelegate
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        sceneDelegate = nil
    }
    
    func testHandleContinueButtonWithNameCallsSceneDelegate() {
        // Given
        let name = "John"
        
        // When
        sut.handleContinueButtonWithName(name)
        
        // Then
        XCTAssertTrue(sceneDelegate.continueWithUsernameCalled)
        XCTAssertEqual(sceneDelegate.continueWithUsernameCallsCount, 1)
        XCTAssertEqual(sceneDelegate.continueWithUsernameReceivedName, name)
    }
}
