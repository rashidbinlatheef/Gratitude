//
//  HomeViewControllerBuilderTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 19/09/22.
//

@testable import Gratitude
import XCTest

final class HomeViewControllerBuilderTests: XCTestCase {
    private var sut: HomeViewControllerBuilder!
    
    override func setUp() {
        super.setUp()
        sut = HomeViewControllerBuilder()
    }
    
    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
    }
    
    func testBuildVisionBoardView() {
        // When
        let result = sut.buildVisionBoardView(
            sceneDelegate: VisionBoardSceneDelegateMock(),
            visionBoard: .generate()
        )
        
        // Then
        XCTAssertTrue(result is VisionBoardViewController)
    }
    
    func testBuildSectionDetailsView() {
        // When
        let result = sut.buildSectionDetailsView(
            sceneDelegate: SectionDetailsSceneDelegateMock(),
            section: .generate(),
            images: [.generate()]
        )
        
        // Then
        XCTAssertTrue(result is SectionDetailsViewController)
    }
    
    func testBuildSectionImageSelectorView() {
        // When
        let result = sut.buildSectionImageSelectorView(
            sceneDelegate: SectionImageSelectorSceneDelegateMock(),
            section: .generate()
        )
        
        // Then
        XCTAssertTrue(result is SectionImageSelectorViewController)
    }
    
    func tetsBuildSectionNameInputView() {
        // When
        let result = sut.buildSectionNameInputView(
            sceneDelegate: SectionNameInputSceneDelegateMock()
        )
        
        // Then
        XCTAssertTrue(result is SectionNameViewController)
    }
}
