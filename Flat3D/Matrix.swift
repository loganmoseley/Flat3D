//
//  Matrix.swift
//  Flat3D
//
//  Created by Logan Moseley on 12/11/16.
//  Copyright © 2016 Logan Moseley. All rights reserved.
//

struct Matrix<T> {
    fileprivate var values: [[[T]]]
    
    let size3: Size3
    
    init(size3: Size3, initializer: @autoclosure () -> T) {
        let i = initializer()
        let z = Array(repeatElement(i, count: size3.length))
        let x = Array(repeatElement(z, count: size3.width))
        let y = Array(repeatElement(x, count: size3.height))
        self.values = y
        self.size3 = size3
    }
    
    fileprivate init(values: [[[T]]], size3: Size3) {
        self.values = values
        self.size3 = size3
    }
    
    mutating func set(value: T, at pt3: Point3) {
        values[pt3.x][pt3.y][pt3.z] = value
    }
}

extension Matrix {
    func forEach(_ body: @escaping (T, Point3) throws -> Void) rethrows -> Void {
        return try values.enumerated().forEach { (i, tss) in
            try tss.enumerated().forEach { (j, ts) in
                try ts.enumerated().forEach { (k, t) in
                    try body(t, Point3(i, j, k))
                }
            }
        }
    }
    
    func map<U>(_ transform: @escaping (T) throws -> U) rethrows -> Matrix<U> {
        let arr = try values.map { try $0.map { try $0.map(transform) } }
        return Matrix<U>(values: arr, size3: size3)
    }
}
