//
//  SectionNameViewControllerTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

@testable import Gratitude
import XCTest

final class SectionNameViewControllerTests: XCTestCase {
    private var sut: SectionNameViewController!
    private var interactor: SectionNameInputInteractingMock!

    override func setUp() {
        super.setUp()
        interactor = SectionNameInputInteractingMock()
        sut = SectionNameViewController.viewController(interactor: interactor)
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
        _ = UINavigationController(rootViewController: sut)
        sut.viewWillAppear(true)
        
        XCTAssertFalse(sut.navigationController?.isNavigationBarHidden ?? true)
    }
}
