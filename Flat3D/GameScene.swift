//
//  GameScene.swift
//  Flat3D
//
//  Created by Logan Moseley on 12/11/16.
//  Copyright © 2016 Logan Moseley. All rights reserved.
//

import SpriteKit
import GameplayKit

func point2(from pt3: Point3, in s3: Size3) -> Point2 {
    return Point2(
        pt3.x + s3.width * pt3.z,
        pt3.y)
}

func size2(from s3: Size3) -> Size2 {
    return Size2(width: s3.width * s3.length, height: s3.height)
}

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    var stones: Matrix<Stone> = Matrix(size3: Size3(2,2,2), initializer: .white)
    
    var stoneLabels: Matrix<SKLabelNode> = Matrix(size3: Size3(2,2,2), initializer: SKLabelNode(text: ""))
    
    var cursor: Cursor = Cursor(position: Point3(0,0,0), context: Size3(2,2,2))
    
    override func didMove(to view: SKView) {
        stones.set(value: .black, at: cursor.position)
        render()
    }
    
    func move(accordingTo key: Key) {
        stones.set(value: .white, at: cursor.position)
        cursor.move(accordingTo: key)
        stones.set(value: .black, at: cursor.position)
        
        render()
    }
    
    func render() {
        guard let view = view else { return }
        
        stoneLabels.forEach { $0.0.removeFromParent() }
        
        stoneLabels = stones.map { SKLabelNode(text: $0.labelNodeText) }

        let size3 = stoneLabels.size3
        let bounds = view.bounds
        
        stoneLabels.forEach { (label, point3) in
            self.addChild(label)
            let pt2 = point2(from: point3, in: size3)
            let s2 = size2(from: size3)
            let x = CGFloat(pt2.x) / CGFloat(s2.width) * bounds.width - (bounds.width / 2)
            let y = CGFloat(pt2.y) / CGFloat(s2.height) * bounds.height
            let mysteriousScalar = 0.5 as CGFloat
            label.position = CGPoint(x: x * mysteriousScalar, y: y * mysteriousScalar)
            label.text = label.text! + "\(point3.x),\(point3.y),\(point3.z)"
        }
    }
    
    override func keyDown(with event: NSEvent) {
        if let key = Key(rawValue: event.keyCode) {
            move(accordingTo: key)
        }
        else {
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
