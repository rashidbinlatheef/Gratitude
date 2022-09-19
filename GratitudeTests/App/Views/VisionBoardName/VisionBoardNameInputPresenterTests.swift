//
//  VisionBoardNameInputPresenterTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 16/09/22.
//

@testable import Gratitude
import XCTest

final class VisionBoardNameInputPresenterTests: XCTestCase {
    private var sut: VisionBoardNameInputPresenter!
    private var view: VisionBoardNameInputViewableMock!

    override func setUp() {
        super.setUp()
        view = VisionBoardNameInputViewableMock()
        sut = VisionBoardNameInputPresenter()
        sut.set(view: view)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        view = nil
    }
    
    func testDisplayCallsRenderOnView() {
        // Given
        let nameList = ["a", "bbsdfb", "fsfdf"]
        let header = "sample header"

        let listActionHandler = VisionBoardNamePickerListActionHandlerMock()
        
        // When
        sut.display(header: header, nameList: nameList, listActionHandler: listActionHandler)

        // Then
        XCTAssertTrue(view.renderHeaderListDataSourceCalled)
        let receivedArguments = view.renderHeaderListDataSourceReceivedArguments
        
        XCTAssertEqual(receivedArguments?.header, header)
        XCTAssertNotNil(receivedArguments?.listDataSource)
    }
    
    func testUpdateVisionBoardName() {
        let visionBoardName = "My Board"
        sut.updateVisionBoardName(visionBoardName)
        XCTAssertEqual(view.updateVisionBoardNameReceivedVisionBoardName, visionBoardName)
    }
}
