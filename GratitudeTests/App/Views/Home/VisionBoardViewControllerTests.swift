//
//  VisionBoardViewControllerTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

@testable import Gratitude
import XCTest

final class VisionBoardViewControllerTests: XCTestCase {
    private var sut: VisionBoardViewController!
    private var interactor: VisionBoardInteractingMock!

    override func setUp() {
        super.setUp()
        interactor = VisionBoardInteractingMock()
        sut = VisionBoardViewController.viewController(interactor: interactor)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        interactor = nil
    }

    func testViewDidLoadSetupNavigationBar() {
        // Given
        _ = UINavigationController(rootViewController: sut)

        // When
        _ = sut.view

        // Then
        XCTAssertNotNil(sut.navigationItem.leftBarButtonItem)
    }
    
    func testViewDidLoadCallsDidloadOnInteractor() {
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
        XCTAssertTrue(sut.navigationItem.hidesBackButton )

    }
    
    func testRender() {
        // Given
        let title = "title"
        let tableDataSource = VisionBoardTableDataSourceProtocolMock()
        _ = sut.view

        // When
        sut.render(title: title, tableDataSource: tableDataSource)

        // Then
        XCTAssertTrue(tableDataSource.useCalled)
        XCTAssertEqual(tableDataSource.useCallsCount, 1)
    }
}
