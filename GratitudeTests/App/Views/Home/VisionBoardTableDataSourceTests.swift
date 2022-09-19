//
//  VisionBoardTableDataSourceTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

@testable import Gratitude
import XCTest

final class VisionBoardTableDataSourceTests: XCTestCase {
    private var sut: VisionBoardTableDataSource!
    private var sections: [Section]!
    private var tableView: UITableViewSpy!
    private var actionHandler: VisionBoardTableActionHandlerMock!
    private var imageStore: ImageStoreMock!

    override func setUp() {
        super.setUp()
        sections = [
            .generate(), .generate(), .generate()
        ]
        tableView = UITableViewSpy()
        actionHandler = VisionBoardTableActionHandlerMock()
        imageStore = ImageStoreMock()
        
        sut = VisionBoardTableDataSource(
            sections: sections,
            actionHandler: actionHandler,
            imageStore: imageStore
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        actionHandler = nil
        sections = nil
        imageStore = nil
        tableView = nil
    }
    
    func testUseCollectionView() {
        // When
        sut.use(tableView)

        // Then
        XCTAssertTrue(tableView.dataSource === sut)
        XCTAssertTrue(tableView.delegate === sut)
    }
    
    func testReloadViewWithSections() {
        // Given
        sut.use(tableView)

        // When
        sut.reloadViewWith(sections)

        // Then
        XCTAssertTrue(tableView.reloadDataCalled)
    }
    
    
    func testNumberOfRows() {
        // Given
        let expectedNumberOfRows = 3
        sut.use(tableView)

        // When
        let result = sut.tableView(tableView, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(result, expectedNumberOfRows)
    }
    
    func testDidSelectRow() {
        // Given
        sut.use(tableView)
        
        // Given
        let expectedSection = sections[0]
        
        // When
        sut.tableView(tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        // Then
        XCTAssertTrue(actionHandler.didSelectSectionCalled)
        XCTAssertEqual(actionHandler.didSelectSectionCallsCount, 1)
        XCTAssertEqual(actionHandler.didSelectSectionReceivedSection, expectedSection)
    }
}
