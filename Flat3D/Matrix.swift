//
//  Matrix.swift
//  Flat3D
//
//  Created by Logan Moseley on 12/11/16.
//  Copyright © 2016 Logan Moseley. All rights reserved.
//

struct Matrix<T> {
    fileprivate var values: [[[T]]]
    
    init(size: Size3, initializer: @autoclosure () -> T) {
        let i = initializer()
        let x = Array(repeatElement(i, count: size.length))
        let y = Array(repeatElement(x, count: size.width))
        let z = Array(repeatElement(y, count: size.height))
        values = z
    }
    
    init(_ values: [[[T]]]) {
        self.values = values
    }
}

extension Matrix {
    func forEach(_ body: @escaping (T) throws -> Void) rethrows -> Void {
        return try values.forEach { try $0.forEach { try $0.forEach(body) } }
    }
    
    func map<U>(_ transform: @escaping (T) throws -> U) rethrows -> Matrix<U> {
        let arr = try values.map { try $0.map { try $0.map(transform) } }
        return Matrix<U>(arr)
    }
}
