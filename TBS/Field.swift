//
//  Field.swift
//  TBS
//
//  Created by Damik Minnegalimov on 18/02/2019.
//  Copyright © 2019 Damirka. All rights reserved.
//

import Foundation
import SceneKit

class Field {
    let node: SCNNode!
    let size: Int!
    let cellSize: Float!
    
    init(in position: SCNVector3, size: Int = 9, cellSize: Float = 0.02) {
        node = SCNNode()
        node.position = position
        self.size = size
        self.cellSize = cellSize
        
        for row in 0..<size {
            for column in 0..<size {
                let cellGeometry = SCNPlane(width: CGFloat(cellSize), height: CGFloat(cellSize))
                // Make the plane visible from both sides
                cellGeometry.firstMaterial?.isDoubleSided = true
                cellGeometry.firstMaterial?.diffuse.contents = UIColor.white
                cellGeometry.cornerRadius = 2
                
                let cell = SCNNode(geometry: cellGeometry)
                cell.position = SCNVector3(Float(row) * cellSize, 0, Float(column) * cellSize)
                cell.eulerAngles = SCNVector3Make(Float.pi / 2, 0, 0)
                
                cell.physicsBody = SCNPhysicsBody(type: .static, shape: nil)
                cell.physicsBody?.categoryBitMask = BodyType.field.rawValue
                cell.physicsBody?.collisionBitMask = BodyType.ship.rawValue
                cell.physicsBody?.contactTestBitMask = BodyType.ship.rawValue
                
                node.addChildNode(cell)
            }
        }
    }
}