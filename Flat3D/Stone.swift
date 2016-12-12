//
//  Stone.swift
//  Flat3D
//
//  Created by Logan Moseley on 12/11/16.
//  Copyright © 2016 Logan Moseley. All rights reserved.
//

enum Stone {
    case black, white
}

extension Stone : LabelNodeRepresentable {
    var labelNodeText: String? {
        switch self {
        case .black: return "⚫"
        case .white: return "⚪"
        }
    }
}
