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
        
        dartResult.matches(regex: "[0-9]{1,2}")!
            .forEach {
                if let number = Int($0) {
                    XCTAssert(0 <= number && number <= 10, "점수는 0~10 사이 값입니다. 문제값 : \(number)")
                } else {
                    XCTAssertFalse(false, "점수가 포함 되어있지 않습니다.")
                }
            }

        XCTAssertNil(dartResult.matches(regex: "[^SDT*#0-9]"), "조건에 맞지 않는 보너스 또는 옵션이 있습니다.")

        let result = Kakao2017Algorithms.dartGame(dartResult: dartResult)
        XCTAssert(result == expectResult, "기대값과 다릅니다. 알고리즘 결과값: \(result)")
    }
    
    func testCache() {
        let cacheSize = 0
        let cities = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
        let expectResult = 25
        
        XCTAssert(0 <= cacheSize && cacheSize <= 30, "캐시크기는 0~30 범위 입니다.")
        XCTAssert(cities.count < 100_000, "도시 최대 크기는 100,000 입니다.")
        cities.forEach { city in
            XCTAssert(city.matches(regex: "[^a-zA-z]") == nil, "공백, 숫자, 특수문자가 포함 되어 있습니다.")
            XCTAssert(city.count < 20, "도시 이름은 최대 20자입니다.")
        }
        
        let result = Kakao2017Algorithms.cache(cacheSize: cacheSize, cities: cities)
        XCTAssert(result == expectResult, "기대값과 다릅니다. 알고리즘 결과값: \(result)")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
