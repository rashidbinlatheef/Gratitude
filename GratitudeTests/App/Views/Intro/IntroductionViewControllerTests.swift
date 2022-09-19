//
//  IntroductionViewControllerTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

@testable import Gratitude
import XCTest

class IntroductionViewControllerTests: XCTestCase {
    private var sut: IntroductionViewController!
    private var interactor: IntroductionInteractingMock!

    override func setUp() {
        super.setUp()
        interactor = IntroductionInteractingMock()
        sut = IntroductionViewController.viewController(interactor: interactor)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        interactor = nil
    }

    func testViewWillAppear() {
        // Given
        let navigationController = UINavigationController(rootViewController: sut)
        _ = sut.view

        // When
        sut.viewWillAppear(true)
        
        XCTAssertTrue(navigationController.isNavigationBarHidden)
    }
}
