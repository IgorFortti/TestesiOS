//
//  ViewControllerSpecs.swift
//  TestesiOSTests
//
//  Created by Igor Fortti on 15/09/23.
//

import Quick
import Nimble
@testable import TestesiOS

class ViewControllerSpecs: QuickSpec {
    
    override func spec() {
        describe("ViewController") {
            var sut: ViewController!
            var sutDummy: ViewModelDummy!
            
            beforeEach {
                sutDummy = ViewModelDummy()
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                sut = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController
                sut?.viewModel = sutDummy
                sut?.loadViewIfNeeded()
            }
            
            context("ChangeCourseAction") {
                it("changeCourseButtonTap") {
                    sut.changeCourseAction(UIButton())
                    expect(sutDummy.hasCourse).to(beTrue())
                }
            }
            
            afterEach {
                sut = nil
                sutDummy = nil
            }
        }
    }
}
