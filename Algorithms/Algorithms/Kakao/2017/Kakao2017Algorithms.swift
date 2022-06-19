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
    
    static func dartGame(dartResult: String) -> Int {
        var score: [Int] = []
        var n = ""
        
        Array(dartResult).forEach {
            if let _ = Int(String($0)) {
                n += String($0)
            } else if $0 == "S", let i = Float(n) {
                score.append(Int(pow(i, 1)))
                n = ""
            } else if $0 == "D", let i = Float(n) {
                score.append(Int(pow(i, 2)))
                n = ""
            } else if $0 == "T", let i = Float(n) {
                score.append(Int(pow(i, 3)))
                n = ""
            } else if $0 == "*" {
                if score.count > 1 { score[score.index(before: score.endIndex) - 1] *= 2 }
                score[score.index(before: score.endIndex)] *= 2    
            } else if $0 == "#" {
                score[score.index(before: score.endIndex)] *= -1
            }
        }

        return score.reduce(0, +)
    }
    
    static func cache(cacheSize: Int, cities: [String]) -> Int {
        let lruCache = LRUCache(cacheSize)
        return 50
    }
}
