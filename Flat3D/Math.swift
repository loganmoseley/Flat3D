//
//  Math.swift
//  Flat3D
//
//  Created by Logan Moseley on 12/11/16.
//  Copyright © 2016 Logan Moseley. All rights reserved.
//

extension Int {
    func clamped(to range: Range<Int>) -> Int {
        // max(range.lowerBound, min(self, range.upperBound))
        // apparently 'max' isn't a function right now? gg swift
        if self <= range.lowerBound {
            return range.lowerBound
        }
        else if self >= range.upperBound {
            return range.upperBound - 1
        }
        else {
            return self
        }
    }
    
    mutating func clamp(to range: Range<Int>) {
        self = self.clamped(to: range)
    }
}
