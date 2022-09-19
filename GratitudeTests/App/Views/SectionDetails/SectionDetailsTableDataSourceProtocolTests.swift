//
//  SectionDetailsTableDataSourceProtocolTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

@testable import Gratitude
import XCTest

final class SectionDetailsTableDataSourceProtocolTests: XCTestCase {
    private var sut: SectionDetailsTableDataSource!
    private var images: [ImagePickerItem]!
    private var tableView: UITableViewSpy!
    private var actionHandler: SectionDetailsTableActionHandlerMock!

    override func setUp() {
        super.setUp()
        images = [
            .generate(), .generate(), .generate()
        ]
        tableView = UITableViewSpy()
        actionHandler = SectionDetailsTableActionHandlerMock()

        sut = SectionDetailsTableDataSource(
            images: images,
            actionHandler: actionHandler
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        actionHandler = nil
        images = nil
        tableView = nil
    }
    
    func testUseCollectionView() {
        // When
        sut.use(tableView)

        // Then
        XCTAssertTrue(tableView.dataSource === sut)
        XCTAssertTrue(tableView.delegate === sut)
    }
    
    func testReloadWithSelectedImages() {
        // Given
        sut.use(tableView)

        // When
        sut.reloadWithImages(images)
        
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
}
