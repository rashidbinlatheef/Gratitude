//
//  OnboardingViewControllerBuilderTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 19/09/22.
//

@testable import Gratitude
import XCTest

final class OnboardingViewControllerBuilderTests: XCTestCase {
    private var sut: OnboardingViewControllerBuilder!
    
    override func setUp() {
        super.setUp()
        sut = OnboardingViewControllerBuilder()
    }
    
    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
    }
    
    func testBuildIntroductionView() {
        // When
        let result = sut.buildIntroductionView(sceneDelegate: IntroductionSceneDelegateMock())
        
        // Then
        XCTAssertTrue(result is IntroductionViewController)
    }
    
    func testBuildUserNameInputView() {
        // When
        let result = sut.buildUserNameInputView(sceneDelegate: UsernameInputSceneDelegateMock())
        
        // Then
        XCTAssertTrue(result is UserNameViewController)
    }
    
    func testBuildVisionBoardNameInputView() {
        // When
        let result = sut.buildVisionBoardNameInputView(
            userName: "",
            sceneDelegate: VisionBoardNameInputSceneDelegateMock()
        )
        
        // Then
        XCTAssertTrue(result is VisionBoardNameViewController)
    }
    
    func testBuildSectionNameInputView() {
        // When
        let result = sut.buildSectionNameInputView(sceneDelegate: SectionNameInputSceneDelegateMock())
        
        // Then
        XCTAssertTrue(result is SectionNameViewController)
    }
}
