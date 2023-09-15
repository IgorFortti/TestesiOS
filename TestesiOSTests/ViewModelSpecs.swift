//
//  ViewModelSpecs.swift
//  TestesiOSTests
//
//  Created by Igor Fortti on 15/09/23.
//

import Quick
import Nimble
import XCTest
@testable import TestesiOS

class ViewModelSpecs: QuickSpec {
    
    override func spec() {
        
        var sut: ViewModel!
        
        beforeEach {
            sut = ViewModel(hasCourse: true)
        }
        
        describe("ViewModel") {
            context("GetDefaultCourse") {
                var hasCourse: Bool!
                var fail: Bool!
                
                beforeEach {
                    hasCourse = false
                    fail = false
                }
                
                it("HasCourseIsTrue") {
                    sut.getDefaultCourse { _ in
                        hasCourse = true
                    } fail: {
                        fail = true
                    }

                    expect(hasCourse).to(beTrue())
                    expect(fail).to(beFalse())
                }
                
                it("HasCourseIsFalse") {
                    sut.hasCourse = false
                    
                    sut.getDefaultCourse { _ in
                        hasCourse = true
                    } fail: {
                        fail = true
                    }

                    expect(hasCourse).to(beFalse())
                    expect(fail).to(beTrue())
                }
            }
            
            context("ChangeHasCourseStatus") {
                it("ChangeHasCourseStatusFalse") {
                    let expectation = XCTestExpectation(description: "ChangeHasCourseStatus expectation")
                    sut.changeHasCourseStatus()
                    DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                        expectation.fulfill()
                    }
                    self.wait(for: [expectation], timeout: 1.0)

                    expect(sut.hasCourse).to(beFalse())
                }
            }

            context("GetHasCourseStatus") {
                it("GetHasCourseStatusTrue") {
                    let expectation = XCTestExpectation(description: "GetHasCourseStatus expectation")
                    sut.getHasCourseStatus { result in
                        expect(result).to(beTrue())
                        expectation.fulfill()
                    }
                    self.wait(for: [expectation], timeout: 1.0)
                }
            }
            
            context("GetCategorie") {
                it("GetCategorieFirstWithSuccess") {
                    sut = ViewModel(hasCourse: true, service: ServicesDummy(status: .success))
                    sut.getCategorie()
                    expect(sut.status).to(equal("animal"))
                }
                
                it("GetCategorieFirstWithError") {
                    sut = ViewModel(hasCourse: true, service: ServicesDummy(status: .invalidResponse))
                    sut.getCategorie()
                    expect(sut.status).to(equal("Erro"))
                }
            }
            
            context("ChangeCourse") {
                it("ChangeCourseAction") {
                    sut = ViewModel(hasCourse: true)
                    expect(sut.changeCourse()).to(beVoid())
                }
            }
        }
        
        afterEach {
            sut = nil
        }
    }
}
