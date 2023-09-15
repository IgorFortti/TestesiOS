//
//  ViewModelDummy.swift
//  TestesiOSTests
//
//  Created by Igor Fortti on 15/09/23.
//

@testable import TestesiOS

final class ViewModelDummy: ViewModelProtocol {
    
    var status: String = ""
    var hasCourse = false
    
    func changeCourse() {
        hasCourse = true
    }
    
    func getDefaultCourse(completion: @escaping (TestesiOS.CourseModel) -> (), fail: () -> ()) {
        completion(CourseModel())
    }
    
    func changeHasCourseStatus() { }
    
    func getHasCourseStatus(completion: @escaping (Bool) -> ()) { }
    
    func getCategorie() { }
}
