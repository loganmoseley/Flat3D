//
//  Matrix.swift
//  Flat3D
//
//  Created by Logan Moseley on 12/11/16.
//  Copyright © 2016 Logan Moseley. All rights reserved.
//

struct Matrix<T> {
    var values: [[[T]]]
    
    init(size: Size3, initializer: @autoclosure () -> T) {
        let i = initializer()
        let x = Array(repeatElement(i, count: size.length))
        let y = Array(repeatElement(x, count: size.width))
        let z = Array(repeatElement(y, count: size.height))
        values = z
    }
}
