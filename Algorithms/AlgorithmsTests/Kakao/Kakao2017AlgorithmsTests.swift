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

    func testDartGame() throws {
        let dartResult = "1D2S3T*"
        let expectResult = 59
        
        Kakao2017Algorithms.matches(regex: "[0-9]{1,2}", in: dartResult)!
            .forEach {
                if let number = Int($0) {
                    XCTAssert(0 <= number && number <= 10, "점수는 0~10 사이 값입니다. 문제값 : \(number)")
                } else {
                    XCTAssertFalse(false, "점수가 포함 되어있지 않습니다.")
                }
            }

        XCTAssertNil(Kakao2017Algorithms.matches(regex: "[^SDT*#0-9]", in: dartResult), "조건에 맞지 않는 보너스 또는 옵션이 있습니다.")

        let result = Kakao2017Algorithms.dartGame(dartResult: dartResult)
        XCTAssert(result == expectResult, "기대값과 다릅니다. 알고리즘 결과값: \(result)")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
