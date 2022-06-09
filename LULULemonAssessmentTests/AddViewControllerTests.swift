//
//  AddViewControllerTests.swift
//  LULULemonAssessmentTests
//
//  Created by Rick Martinez on 6/8/22.
//

import XCTest
@testable import LULULemonAssessment

class AddViewControllerTests: XCTestCase {
    
    var sut: AddViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = (storyboard.instantiateViewController(identifier: "AddVC" ) as! AddViewController)
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testTextField_ShouldBeEmpty() {
        let textFieldIsEmpty = !sut.textField.hasText
        XCTAssertTrue(textFieldIsEmpty)
    }
    
}
