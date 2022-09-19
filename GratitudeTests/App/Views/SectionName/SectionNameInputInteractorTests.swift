//
//  SectionNameInputInteractorTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

@testable import Gratitude
import XCTest

final class SectionNameInputInteractorTests: XCTestCase {
    private var sut: SectionNameInputInteractor!
    private var sceneDelegate: SectionNameInputSceneDelegateMock!
    private var presenter: SectionNameInputPresentingMock!
    private var userName: String!

    override func setUp() {
        super.setUp()
        sceneDelegate = SectionNameInputSceneDelegateMock()
        presenter = SectionNameInputPresentingMock()
        sut = SectionNameInputInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        sceneDelegate = nil
        userName = nil
    }
    
    func testDidLoadCallsShowSectionPickerItemsOnPresenter() {
        // Given
        let expectedPickerItems = ["Travel", "Work", "Relationships", "Health", "Finance"]
        
        // When
        sut.didLoad()
        
        // Then
        XCTAssertTrue(presenter.showSectionPickerItemsCalled)
        XCTAssertEqual(presenter.showSectionPickerItemsCallsCount, 1)
        XCTAssertEqual(presenter.showSectionPickerItemsReceivedItemTitles, expectedPickerItems)
    }
    
    func testHandleContinueButtonWithNameCallsSceneDelegate() {
        // Given
        let name = "My Summer Trip"
        
        // When
        sut.handleContinueButtonWithName(name)
        
        // Then
        XCTAssertTrue(sceneDelegate.continueWithSectionNameCalled)
        XCTAssertEqual(sceneDelegate.continueWithSectionNameCallsCount, 1)
        XCTAssertEqual(sceneDelegate.continueWithSectionNameReceivedName, name)
    }
}
