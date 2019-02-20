//
//  Character.swift
//  TBS
//
//  Created by Damik Minnegalimov on 18/02/2019.
//  Copyright © 2019 Damirka. All rights reserved.
//

import Foundation
import SceneKit

enum CharacterRole: Int {
    case tank = 1
    case support = 2
    case dps = 3
}

class Character {
    let node: SCNNode!
    let role: CharacterRole!
    
    init(role: CharacterRole, in position: SCNVector3) {
        let box: SCNBox
        let color: UIColor
        let cellSize: CGFloat = 0.02

        switch role {
        case .tank:
            box = SCNBox(width: cellSize * 0.8, height: cellSize * 2, length: cellSize * 0.4, chamferRadius: 0)
            color = .blue
        case .dps:
            box = SCNBox(width: cellSize * 0.4, height: cellSize * 1, length: cellSize * 0.4, chamferRadius: 0)
            color = .red
        case .support:
            box = SCNBox(width: cellSize * 0.2, height: cellSize * 0.8, length: cellSize * 0.2, chamferRadius: 0)
            color = .yellow
        }
        
        box.firstMaterial?.diffuse.contents = color
        box.firstMaterial?.isDoubleSided = true
        
        node = SCNNode(geometry: box)
        node.position = position
        self.role = role
    }

    init(width: Int, height: Int, length: Int, in position: SCNVector3) {
        let box = SCNBox(width: CGFloat(width), height: CGFloat(height), length: CGFloat(length), chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.blue
        box.firstMaterial?.isDoubleSided = true
        
        node = SCNNode(geometry: box)
        node.position = position
        self.role = .tank
    }
}