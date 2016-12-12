//
//  Cursor.swift
//  Flat3D
//
//  Created by Logan Moseley on 12/11/16.
//  Copyright © 2016 Logan Moseley. All rights reserved.
//

struct Cursor {
    var position: Point3
    let context: Size3
    
    mutating func move(accordingTo key: Key) {
        switch key {
        case .left:
            self.position.x -= 1
            
        case .right:
            self.position.x += 1
            
        case .down:
            self.position.y -= 1
            
        case .up:
            self.position.y += 1
            
        case .out:
            self.position.z -= 1
            
        case .in:
            self.position.z += 1
        }
        
        self.position = self.position.clamped(to: context)
    }
}

extension Point3 {
    func clamped(to size3: Size3) -> Point3 {
        return Point3(
            x: self.x.clamped(to: (0..<size3.width)),
            y: self.y.clamped(to: (0..<size3.height)),
            z: self.z.clamped(to: (0..<size3.length)))
    }
}
