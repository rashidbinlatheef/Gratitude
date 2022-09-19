//
//  VisionBoardNamePickerListDataSourceTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 16/09/22.
//

import XCTest
@testable import Gratitude

final class VisionBoardNamePickerListDataSourceTests: XCTestCase {
    private var sut: VisionBoardNamePickerListDataSource!
    private var nameList: [String]!
    private var actionHandler: VisionBoardNamePickerListActionHandlerMock!

    override func setUp() {
        super.setUp()
        nameList = ["a", "bbsdfb", "fsfdf"]
        actionHandler = VisionBoardNamePickerListActionHandlerMock()

        sut = VisionBoardNamePickerListDataSource(
            nameList: nameList,
            actionHandler: actionHandler
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        actionHandler = nil
        nameList = nil
    }
    
    func testUseCollectionView() {
        // Given
        let collectionView = UICollectionViewSpy(
            frame: .zero,
            collectionViewLayout: .init()
        )
        
        // When
        sut.use(collectionView)

        // Then
        XCTAssertTrue(collectionView.dataSource === sut)
    }
    
    func testUpdateVicollectionViewNumberOfRows() {
        let expectedNumberOfRows = 3
        let collectionView = UICollectionViewSpy(
            frame: .zero,
            collectionViewLayout: .init()
        )

        let result = sut.collectionView(collectionView, numberOfItemsInSection: 0)
        
        XCTAssertEqual(result, expectedNumberOfRows)
    }
}
