//
//  SectionImageSelectorPresenterTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 17/09/22.
//

@testable import Gratitude
import XCTest

final class SectionImageSelectorPresenterTests: XCTestCase {
    private var sut: SectionImageSelectorPresenter!
    private var view: SectionImageSelectorViewableMock!

    override func setUp() {
        super.setUp()
        view = SectionImageSelectorViewableMock()
        sut = SectionImageSelectorPresenter()
        sut.set(view: view)
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        view = nil
    }
    
    func testDisplaySearchTextWithImagesAndActionHandler() {
        // Given
        let searchText = "summer"
        let selectedImages: [ImagePickerItem] = [
            .generate(),
            .generate()
        ]
        let images: [ImagePickerItem] = [
            .generate(),
            .generate(),
            .generate(),
            .generate()
        ] + selectedImages
        let tableActionHandler = SectionImageListActionHandlerMock()
        
        // When
        sut.display(
            searchText: searchText,
            images: images,
            selectedImages: selectedImages,
            tableActionHandler: tableActionHandler
        )

        // Then
        XCTAssertTrue(view.renderSearchTextListDataSourceCalled)
        let receivedArguments = view.renderSearchTextListDataSourceReceivedArguments
        
        XCTAssertEqual(receivedArguments?.searchText, searchText)
        XCTAssertNotNil(receivedArguments?.listDataSource)
    }
    
    func testDidUpdateImageSelection() {
        // Given
        let selectedImages: [ImagePickerItem] = [
            .generate(),
            .generate()
        ]

        // When
        sut.didUpdateImageSelection(selectedImages)
        
        
        // Then
        XCTAssertTrue(view.showSelectedImagesCalled)
        XCTAssertEqual(view.showSelectedImagesReceivedImages, selectedImages)
    }
    
    func testShowImageLimitBanner() {
        // Given
        let show = true

        // When
        sut.showImageLimitBanner(show)
        
        
        // Then
        XCTAssertTrue(view.showImageLimitBannerCalled)
        XCTAssertEqual(view.showImageLimitBannerReceivedShow, show)
    }
    
    func testShowNetworkProgressIndicator() {
        // Given
        let show = true

        // When
        sut.showNetworkProgressIndicator(show)
        
        
        // Then
        XCTAssertTrue(view.showNetworkProgressIndicatorCalled)
        XCTAssertEqual(view.showNetworkProgressIndicatorReceivedShow, show)
    }
}
