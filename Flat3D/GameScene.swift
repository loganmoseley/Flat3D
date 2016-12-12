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
    
    override func didMove(to view: SKView) {
        
        let labels = stones.map { SKLabelNode(text: $0.labelNodeText) }
        
        labels.forEach { (label, point3) in
            self.addChild(label)
            let pt2 = point2(from: point3, in: labels.size3)
            let s2 = size2(from: labels.size3)
            let x = CGFloat(pt2.x) / CGFloat(s2.width) * view.bounds.width
            let y = CGFloat(pt2.y) / CGFloat(s2.height) * view.bounds.height
            label.position = CGPoint(x: x, y: y)
            label.text = label.text! + "\(point3.x),\(point3.y),\(point3.z)"
        }
        
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(M_PI), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func mouseDown(with event: NSEvent) {
        self.touchDown(atPoint: event.location(in: self))
    }
    
    override func mouseDragged(with event: NSEvent) {
        self.touchMoved(toPoint: event.location(in: self))
    }
    
    override func mouseUp(with event: NSEvent) {
        self.touchUp(atPoint: event.location(in: self))
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31:
            if let label = self.label {
                label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
            }
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
