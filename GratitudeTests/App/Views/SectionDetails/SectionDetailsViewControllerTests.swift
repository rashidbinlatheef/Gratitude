//
//  SectionDetailsViewControllerTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

@testable import Gratitude
import XCTest

class SectionDetailsViewControllerTests: XCTestCase {
    private var sut: SectionDetailsViewController!
    private var interactor: SectionDetailsInteractingMock!

    override func setUp() {
        super.setUp()
        interactor = SectionDetailsInteractingMock()
        sut = SectionDetailsViewController.viewController(interactor: interactor)
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
        let navigationController = UINavigationController(rootViewController: sut)
        _ = sut.view

        // When
        sut.viewWillAppear(true)
        
        // Then
        XCTAssertFalse(navigationController.isNavigationBarHidden)
    }
    
    func testRender() {
        // Given
        _ = sut.view

        let listDataSource = SectionDetailsTableDataSourceProtocolMock()
        
        // When
        sut.render(title: "", tableDataSource: listDataSource)

        // Then
        XCTAssertTrue(listDataSource.useCalled)
        XCTAssertEqual(listDataSource.useCallsCount, 1)
    }
}
