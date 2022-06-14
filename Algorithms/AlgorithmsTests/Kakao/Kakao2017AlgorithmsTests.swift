//
//  Kakao2017AlgorithmsTests.swift
//  AlgorithmsTests
//
//  Created by 박성원 on 2022/06/15.
//

import XCTest
@testable import Algorithms

class Kakao2017AlgorithmsTests: XCTestCase {
    func testSecretMap() throws {
        let n = 5
        let arr1 = [9, 20, 28, 18, 11]
        let arr2 = [30, 1, 21, 17, 28]
        let expectResult = ["#####","# # #", "### #", "#  ##", "#####"]
        
        XCTAssert(1 <= n && n <= 16)
        XCTAssertEqual(n, arr1.count, "arr1은 길이 n인 정수 배열로 주어진다.")
        XCTAssertEqual(n, arr2.count, "arr2는 길이 n인 정수 배열로 주어진다.")
        
        arr1.forEach { value in
            XCTAssert(0 <= value && value <= Int(pow(2.0, Float(n)) - 1), "0 ≦ x ≦ 2^n – 1을 만족해야 합니다.")
        }
        
        let result = Kakao2017Algorithms.secretMap(n: n, arr1: arr1, arr2: arr2)
        
        XCTAssertEqual(result, expectResult, "기대값과 다릅니다. 알고리즘 결과값: \(result)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
