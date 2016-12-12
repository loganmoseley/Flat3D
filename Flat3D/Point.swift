//
//  Point.swift
//  Flat3D
//
//  Created by Logan Moseley on 12/11/16.
//  Copyright © 2016 Logan Moseley. All rights reserved.
//

struct Point2 {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

struct Point3 {
    var x: Int
    var y: Int
    var z: Int
    
    init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
    
    init(_ x: Int, _ y: Int, _ z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }
}
