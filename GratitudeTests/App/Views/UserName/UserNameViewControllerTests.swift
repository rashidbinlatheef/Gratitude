//
//  UserNameViewControllerTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

import XCTest
@testable import Gratitude

final class UserNameViewControllerTests: XCTestCase {
    private var sut: UserNameViewController!
    private var interactor: UserNameInputInteractingMock!

    override func setUp() {
        super.setUp()
        interactor = UserNameInputInteractingMock()
        sut = UserNameViewController.viewController(interactor: interactor)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        interactor = nil
    }

    func testViewWillAppear() {
        let navigationVC = UINavigationController(rootViewController: sut)
        _ = sut.view

        // When
        sut.viewWillAppear(true)
        
        // Then
        XCTAssertTrue(navigationVC.isNavigationBarHidden)
    }
}
