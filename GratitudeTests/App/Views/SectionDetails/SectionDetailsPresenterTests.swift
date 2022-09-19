//
//  SectionDetailsPresenterTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

@testable import Gratitude
import XCTest

final class SectionDetailsPresenterTests: XCTestCase {
    private var sut: SectionDetailsPresenter!
    private var view: SectionDetailsViewableMock!

    override func setUp() {
        super.setUp()
        view = SectionDetailsViewableMock()
        sut = SectionDetailsPresenter()
        sut.set(view: view)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        view = nil
    }
    
    func testDisplay() {
        // Given
        let section = Section.generate()
        let images: [ImagePickerItem] = [
            .generate(),
            .generate(),
            .generate(),
            .generate()
        ]
        let tableActionHandler = SectionDetailsTableActionHandlerMock()
        
        // When
        sut.display(
            section: section,
            images: images,
            tableActionHandler: tableActionHandler
        )

        // Then
        XCTAssertTrue(view.renderTitleTableDataSourceCalled)
        let receivedArguments = view.renderTitleTableDataSourceReceivedArguments
        
        XCTAssertEqual(receivedArguments?.title, section.name)
        XCTAssertNotNil(receivedArguments?.tableDataSource)
    }
}
