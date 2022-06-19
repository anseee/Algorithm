//
//  String+Matches.swift
//  Algorithms
//
//  Created by 박성원 on 2022/06/19.
//

import Foundation

extension String {
    func matches(regex: String) -> [String]? {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self,
                                        range: NSRange(self.startIndex..., in: self))
            
            if results.isEmpty {
                return nil
            }
            return results.map {
                String(self[Range($0.range, in: self)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
