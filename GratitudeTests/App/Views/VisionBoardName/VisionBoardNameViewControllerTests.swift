//
//  VisionBoardNameViewControllerTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 15/09/22.
//

@testable import Gratitude
import XCTest

final class VisionBoardNameViewControllerTests: XCTestCase {
    private var sut: VisionBoardNameViewController!
    private var interactor: VisionBoardNameInputInteractingMock!

    override func setUp() {
        super.setUp()
        interactor = VisionBoardNameInputInteractingMock()
        sut = VisionBoardNameViewController.viewController(interactor: interactor)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        interactor = nil
    }

    func testViewDidLoad() {
        // When
        _ = sut.view

        // Then
        XCTAssertEqual(interactor.didLoadCallsCount, 1)
    }
    
    func testViewWillAppear() {
        // Given
        let navigationVC = UINavigationController(rootViewController: sut)
        _ = sut.view

        // When
        sut.viewWillAppear(true)
        
        // Then

        XCTAssertFalse(navigationVC.isNavigationBarHidden)
    }
    
    func testRenderHeaderWithListDataSourceCallsUseOnVisionBoardNamePickerListDataSourceProtocol() {
        _ = sut.view

        let listDataSource = VisionBoardNamePickerListDataSourceProtocolMock()
        
        // When
        sut.render(header: "", listDataSource: listDataSource)

        // Then
        XCTAssertTrue(listDataSource.useCalled)
        XCTAssertEqual(listDataSource.useCallsCount, 1)
        
    }
}
