//
//  SectionImageSelectorInteractorTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

@testable import Gratitude
import XCTest

final class SectionImageSelectorInteractorTests: XCTestCase {
    private var sut: SectionImageSelectorInteractor!
    private var sceneDelegate: SectionImageSelectorSceneDelegateMock!
    private var presenter: SectionImageSelectorPresentingMock!
    private var section: Section!
    private var pexelAPI: PexelAPIServiceMock!
    private var imageStore: ImageStoreMock!
    
    override func setUp() {
        super.setUp()
        sceneDelegate = SectionImageSelectorSceneDelegateMock()
        presenter = SectionImageSelectorPresentingMock()
        section = Section.generate()
        pexelAPI = PexelAPIServiceMock()
        imageStore = ImageStoreMock()
        
        sut = SectionImageSelectorInteractor(
            sceneDelegate: sceneDelegate,
            presenter: presenter,
            section: section,
            pexelAPI: pexelAPI,
            imageStore: imageStore
        )
    }
    
    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        sceneDelegate = nil
        presenter = nil
        section = nil
        pexelAPI = nil
        imageStore = nil
    }
    
    func testDidLoadCallsShowNetworkProgressIndicatorOnPresenter() {
        // When
        sut.didLoad()
        
        // Then
        XCTAssertTrue(presenter.showNetworkProgressIndicatorCalled)
        XCTAssertEqual(presenter.showNetworkProgressIndicatorCallsCount, 1)
        XCTAssertTrue(presenter.showNetworkProgressIndicatorReceivedShow!)
    }
    
    func testDidLoadCallsSearchImagesOnPexelAPIWithCorrectArguments() {
        // Given
        let expectedSearchText = section.name
        
        // When
        sut.didLoad()
        
        // Then
        XCTAssertTrue(pexelAPI.searchImagesQuerryCompletionCalled)
        XCTAssertEqual(pexelAPI.searchImagesQuerryCompletionReceivedArguments?.querry, expectedSearchText)
    }
    
    
    func testDidLoadCallsShowNetworkProgressIndicatorOnPresenterAfterSearchImageCompletetion() {
        // Given
        let result: Result<PexelPhotoSearchResponse, PexelNetworkingError> = .success(.generate())
        
        // When
        sut.didLoad()
        pexelAPI.searchImagesQuerryCompletionReceivedArguments?.completion(result)
        
        // Then
        XCTAssertEqual(presenter.showNetworkProgressIndicatorCallsCount, 2)
        XCTAssertFalse(presenter.showNetworkProgressIndicatorReceivedShow!)
    }
    
    func testDidLoadCallsMethodsOnPresenterAfterSuccesfullSearchImageCompletetion() {
        // Given
        let result: Result<PexelPhotoSearchResponse, PexelNetworkingError> = .success(.generate())
        
        // When
        sut.didLoad()
        pexelAPI.searchImagesQuerryCompletionReceivedArguments?.completion(result)
        
        // Then
        XCTAssertTrue(presenter.didUpdateImageSelectionCalled)
        XCTAssertTrue(presenter.displaySearchTextImagesSelectedImagesTableActionHandlerCalled)
    }
}
