//
//  Size.swift
//  Flat3D
//
//  Created by Logan Moseley on 12/11/16.
//  Copyright © 2016 Logan Moseley. All rights reserved.
//

struct Size2 {
    let width: Int
    let height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    init(_ width: Int, _ height: Int) {
        self.width = width
        self.height = height
    }
}

struct Size3 {
    let length: Int
    let width: Int
    let height: Int
    
    init(length: Int, width: Int, height: Int) {
        self.length = length
        self.width = width
        self.height = height
    }
    
    init(_ length: Int, _ width: Int, _ height: Int) {
        self.length = length
        self.width = width
        self.height = height
    }
}
