//
//  SectionImageSelectorViewControllerTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

@testable import Gratitude
import XCTest

final class SectionImageSelectorViewControllerTests: XCTestCase {
    private var sut: SectionImageSelectorViewController!
    private var interactor: SectionImageSelectorInteractingMock!

    override func setUp() {
        super.setUp()
        interactor = SectionImageSelectorInteractingMock()
        sut = SectionImageSelectorViewController.viewController(interactor: interactor)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        interactor = nil
    }

    func testViewDidLoadCallsDidloadOnInteractor() {
        // Given
        let navigationController = UINavigationController(rootViewController: sut)

        // When
        _ = sut.view

        // Then
        XCTAssertFalse(navigationController.isNavigationBarHidden)
        XCTAssertTrue(sut.navigationItem.titleView is UISearchBar)
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem)
        XCTAssertEqual(sut.navigationItem.rightBarButtonItems?.count, 1)
    }
    
    func testViewDidLoadSetupNavigationBar() {
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

        XCTAssertFalse(navigationVC.isNavigationBarHidden)
    }
    
    func testRenderSearchTextListDataSource() {
        // Given
        let listDataSource = SectionImageListDataSourceProtocolMock()
        _ = sut.view

        // When
        sut.render(searchText: "some texts", listDataSource: listDataSource)

        // Then
        XCTAssertTrue(listDataSource.useCalled)
        XCTAssertEqual(listDataSource.useCallsCount, 1)
    }
}
