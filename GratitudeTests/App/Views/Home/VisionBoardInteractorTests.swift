//
//  VisionBoardInteractorTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

@testable import Gratitude
import XCTest

final class VisionBoardInteractorTests: XCTestCase {
    private var sut: VisionBoardInteractor!
    private var sceneDelegate: VisionBoardSceneDelegateMock!
    private var presenter: VisionBoardPresentingMock!
    private var visionBoard: VisionBoard!
    
    override func setUp() {
        super.setUp()
        sceneDelegate = VisionBoardSceneDelegateMock()
        presenter = VisionBoardPresentingMock()
        visionBoard = VisionBoard.generate()
        
        sut = VisionBoardInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter,
            visionBoard: visionBoard
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        sceneDelegate = nil
        presenter = nil
        visionBoard = nil
    }
    
    func testDidLoad() {
        // When
        sut.didLoad()
        
        // Then
        XCTAssertTrue(presenter.displayVisionBoardTableActionHandlerCalled)
        XCTAssertEqual(presenter.displayVisionBoardTableActionHandlerCallsCount, 1)
       
        let receivedArguments = presenter.displayVisionBoardTableActionHandlerReceivedArguments
        
        XCTAssertEqual(receivedArguments?.visionBoard, visionBoard)
        XCTAssertTrue(receivedArguments?.tableActionHandler === sut)
    }
    
    func tetsHandleAddAnotherButtonTap() {
        // When
        sut.handleAddAnotherButtonTap()
        
        // Then
        XCTAssertTrue(sceneDelegate.goToAddNewSectionCalled)
        XCTAssertEqual(sceneDelegate.goToAddNewSectionCallsCount, 1)
    }
    
    func testEditButtonTappedFor() {
        let section = visionBoard.sections[0]
        
        // When
        sut.editButtonTappedFor(section)
        
        // Then
        XCTAssertTrue(sceneDelegate.goToSectionDetailsScreenCalled)
        XCTAssertEqual(sceneDelegate.goToSectionDetailsScreenCallsCount, 1)
        XCTAssertEqual(sceneDelegate.goToSectionDetailsScreenReceivedSection, section)
    }

    func testAddPhotoButtonTappedFor() {
        let section = visionBoard.sections[0]
        
        // When
        sut.addPhotoButtonTappedFor(section)
        
        // Then
        XCTAssertTrue(sceneDelegate.goToSectionDetailsScreenCalled)
        XCTAssertEqual(sceneDelegate.goToSectionDetailsScreenCallsCount, 1)
        XCTAssertEqual(sceneDelegate.goToSectionDetailsScreenReceivedSection, section)
    }
    
    func testDidSelectSection() {
        let section = visionBoard.sections[0]
        
        // When
        sut.didSelectSection(section)
        
        // Then
        XCTAssertTrue(sceneDelegate.goToSectionDetailsScreenCalled)
        XCTAssertEqual(sceneDelegate.goToSectionDetailsScreenCallsCount, 1)
        XCTAssertEqual(sceneDelegate.goToSectionDetailsScreenReceivedSection, section)}
}
