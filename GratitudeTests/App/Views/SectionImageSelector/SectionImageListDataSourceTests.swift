//
//  SectionImageListDataSourceTests.swift
//  GratitudeTests
//
//  Created by Muhammed Rashid on 18/09/22.
//

@testable import Gratitude
import XCTest

final class SectionImageListDataSourceTests: XCTestCase {
    private var sut: SectionImageListDataSource!
    private var images: [ImagePickerItem]!
    private var collectionView: UICollectionViewSpy!
    private var selectedImages: [ImagePickerItem]!
    private var actionHandler: SectionImageListActionHandlerMock!

    override func setUp() {
        super.setUp()
        selectedImages = [.generate(), .generate()]
        images = [
            .generate(), .generate(), .generate()
        ] + selectedImages
        collectionView = UICollectionViewSpy(
            frame: .zero,
            collectionViewLayout: .init()
        )
        actionHandler = SectionImageListActionHandlerMock()

        sut = SectionImageListDataSource(
            images: images,
            actionHandler: actionHandler,
            selectedImages: selectedImages
        )
    }

    override func tearDown() {
        defer { super.tearDown() }
        sut = nil
        actionHandler = nil
        images = nil
        selectedImages = nil
        collectionView = nil
    }
    
    func testUseCollectionView() {
        // When
        sut.use(collectionView)

        // Then
        XCTAssertTrue(collectionView.dataSource === sut)
        XCTAssertTrue(collectionView.delegate === sut)
    }
    
    func testReloadWithSelectedImages() {
        // Given
        sut.use(collectionView)

        // When
        sut.reloadWithSelectedImages(selectedImages)
        
        // Then
        XCTAssertTrue(collectionView.reloadDataCalled)
    }
    
    
    func testReloadWithImages() {
        // Given
        sut.use(collectionView)

        // When
        sut.reloadWithImages(images, selectedImages: selectedImages)
        
        // Then
        XCTAssertTrue(collectionView.reloadDataCalled)
    }
    
    func testNumberOfRows() {
        // Given
        let expectedNumberOfRows = 5
        sut.use(collectionView)

        // When
        let result = sut.collectionView(collectionView, numberOfItemsInSection: 0)
        
        // Then
        XCTAssertEqual(result, expectedNumberOfRows)
    }
    
    func testDidSelectRow() {
        // Given
        sut.use(collectionView)
        let expectedImage = images[0]

        // When
        sut.collectionView(
            collectionView,
            didSelectItemAt: IndexPath(item: 0, section: 0)
        )
        
        // Then
        XCTAssertTrue(actionHandler.didSelectImageCalled)
        XCTAssertEqual(actionHandler.didSelectImageReceivedImage, expectedImage)

    }
}
