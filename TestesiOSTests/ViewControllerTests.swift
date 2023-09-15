//
//  ViewControllerTests.swift
//  TestesiOSTests
//
//  Created by Igor Fortti on 15/09/23.
//

import XCTest
@testable import TestesiOS

final class ViewControllerTests: XCTestCase {
    
    var sut: ViewController?

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController
        sut?.viewModel = ViewModelDummy()
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testChangeCourseAction() {
        let course = sut?.courseValueLabel.text
        XCTAssertEqual(course, "Swift")
        
        sut?.changeCourseAction(UIButton())
        XCTAssertNotEqual(course, sut?.courseValueLabel.text)
        
        sut?.changeCourseAction(UIButton())
        XCTAssertEqual(course, "Swift")
    }
}
