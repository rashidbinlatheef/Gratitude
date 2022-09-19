//
//  SectionDetailsInteractorTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

import XCTest
@testable import Gratitude

final class SectionDetailsInteractorTests: XCTestCase {
    private var sut: SectionDetailsInteractor!
    private var sceneDelegate: SectionDetailsSceneDelegateMock!
    private var presenter: SectionDetailsPresentingMock!
    private var section: Section!
    private var images: [ImagePickerItem]!
    
    override func setUp() {
        super.setUp()
        sceneDelegate = SectionDetailsSceneDelegateMock()
        presenter = SectionDetailsPresentingMock()
        section = Section.generate()
        images = [.generate(), .generate(), .generate()]
        
        sut = SectionDetailsInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter,
            section: section,
            images: images
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        sceneDelegate = nil
        presenter = nil
        section = nil
        images = nil
    }
    
    func testDidLoad() {
        // When
        sut.didLoad()
        
        // Then
        XCTAssertTrue(presenter.displaySectionImagesTableActionHandlerCalled)
        XCTAssertEqual(presenter.displaySectionImagesTableActionHandlerCallsCount, 1)
       
        let receivedArguments = presenter.displaySectionImagesTableActionHandlerReceivedArguments
        
        XCTAssertEqual(receivedArguments?.section, section)
        XCTAssertEqual(receivedArguments?.images, images)
        XCTAssertTrue(receivedArguments?.tableActionHandler === sut)
    }
    
    func testHandleAddPhotoButtonAction() {
        // When
        sut.handleAddPhotoButtonAction()
        
        // Then
        XCTAssertTrue(sceneDelegate.goToAddPhotoForCalled)
        XCTAssertEqual(sceneDelegate.goToAddPhotoForCallsCount, 1)
        XCTAssertEqual(sceneDelegate.goToAddPhotoForReceivedSection, section)
    }
    
    func testHandleDoneButtonAction() {
        // When
        sut.handleDoneButtonAction()
        
        // Then
        XCTAssertTrue(sceneDelegate.didFinishUpdatingDetailsForSectionImagesCalled)
        XCTAssertEqual(sceneDelegate.didFinishUpdatingDetailsForSectionImagesCallsCount, 1)
        
        let receivedArguments = sceneDelegate.didFinishUpdatingDetailsForSectionImagesReceivedArguments

        XCTAssertEqual(receivedArguments?.section, section)
        XCTAssertEqual(receivedArguments?.images, images)

    }

    
    func testDeleteButtonTappedFor() {
        // Given
        let imageToBeDeleted = images[0]

        // When
        sut.deleteButtonTappedFor(imageToBeDeleted)

        // Then
        XCTAssertTrue(presenter.reloadListWithCalled)
    }
}
