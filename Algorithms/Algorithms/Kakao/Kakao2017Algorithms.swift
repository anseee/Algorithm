//
//  Kakao2017Algorithms.swift
//  Algorithms
//
//  Created by 박성원 on 2022/06/15.
//

import Foundation

struct Kakao2017Algorithms {
    static func secretMap(n: Int, arr1: [Int], arr2: [Int]) -> [String] {
        var results: [String] = []
        
        for i in 0..<n {
            let arr1Value = arr1[i]
            let arr2Value = arr2[i]
            var result = String(arr1Value | arr2Value, radix: 2)
            result = result.replacingOccurrences(of: "0", with: " ")
            result = result.replacingOccurrences(of: "1", with: "#")
            results.append(result)
        }

        return results
    }
}
