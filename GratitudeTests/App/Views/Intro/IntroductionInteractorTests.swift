//
//  IntroductionInteractorTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

@testable import Gratitude
import XCTest

final class IntroductionInteractorTests: XCTestCase {
    private var sut: IntroductionInteractor!
    private var sceneDelegate: IntroductionSceneDelegateMock!
    
    override func setUp() {
        super.setUp()
        sceneDelegate = IntroductionSceneDelegateMock()
        
        sut = IntroductionInteractor(
            sceneDelegate: sceneDelegate
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        sceneDelegate = nil
    }
    
    func testHandleBuildVisionBoardButtonTap() {
        // When
        sut.handleBuildVisionBoardButtonTap()
        
        // Then
        XCTAssertTrue(sceneDelegate.continueWithBuildingVisionBoardCalled)
        XCTAssertEqual(sceneDelegate.continueWithBuildingVisionBoardCallsCount, 1)
    }
}
