//
//  LULULemonAssessmentTests.swift
//  LULULemonAssessmentTests
//
//  Created by Rick Martinez on 6/8/22.
//

import XCTest
@testable import LULULemonAssessment

class ViewControllerTests: XCTestCase {
    
    var sut: ViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = (storyboard.instantiateViewController(identifier: "ListID" ) as! ViewController)
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testTableView_InitialAmountOfRows() {
        let numOfRows = sut.tableView.numberOfRows(inSection: 0)
        XCTAssertGreaterThanOrEqual(numOfRows, 3)
    }
    
    func testTableView_PreloadedGarment() {
        if let cell = sut.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? GarmentCell {
            if sut.segmentControl.selectedSegmentIndex == 0 {
                XCTAssertEqual(cell.nameLabel.text, "Jeans")
            }
        }
    }
    
    func testGarmentArray_InitialAmountOfGarments() {
        let numOfGarments = sut.garmentArray.count
        XCTAssertGreaterThanOrEqual(numOfGarments, 3)
    }
    
    func testSegmentControl_InitialIndex() {
        let initialIndex = sut.segmentControl.selectedSegmentIndex
        XCTAssertEqual(initialIndex, 0)
    }
    
}

