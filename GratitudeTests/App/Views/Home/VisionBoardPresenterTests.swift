//
//  VisionBoardPresenterTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

import XCTest
@testable import Gratitude

final class VisionBoardPresenterTests: XCTestCase {
    private var sut: VisionBoardPresenter!
    private var view: VisionBoardViewableMock!

    override func setUp() {
        super.setUp()
        view = VisionBoardViewableMock()
        sut = VisionBoardPresenter()
        sut.set(view: view)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        view = nil
    }
    
    func testDisplay() {
        // Given
        let visionBoard = VisionBoard.generate()
        let tableActionHandler = VisionBoardTableActionHandlerMock()
        
        // When
        sut.display(
            visionBoard: visionBoard,
            tableActionHandler: tableActionHandler
        )

        // Then
        XCTAssertTrue(view.renderTitleTableDataSourceCalled)
        let receivedArguments = view.renderTitleTableDataSourceReceivedArguments
        
        XCTAssertEqual(receivedArguments?.title, visionBoard.name)
        XCTAssertNotNil(receivedArguments?.tableDataSource)
    }
}
