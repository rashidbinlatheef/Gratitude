//
//  SectionNameInputPresenterTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

@testable import Gratitude
import XCTest

class SectionNameInputPresenterTests: XCTestCase {
    private var sut: SectionNameInputPresenter!
    private var view: SectionNameInputViewableMock!

    override func setUp() {
        super.setUp()
        view = SectionNameInputViewableMock()
        sut = SectionNameInputPresenter()
        sut.set(view: view)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        view = nil
    }
    
    func showSectionPickerItems() {
        // Given
        let itemTitles = ["a", "bbsdfb", "fsfdf"]
        
        // When
        sut.showSectionPickerItems(itemTitles)

        // Then
        XCTAssertTrue(view.loadSectionNamePickerTitlesCalled)
        XCTAssertEqual(view.loadSectionNamePickerTitlesCallsCount, 1)
        XCTAssertEqual(view.loadSectionNamePickerTitlesReceivedTitles, itemTitles)
    }
}
