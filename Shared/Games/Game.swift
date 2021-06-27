//
//  Game.swift
//  SwiftUI-Games (iOS)
//
//  Created by Damir Minnegalimov on 16.06.2021.
//

import SceneKit

protocol Game {
  var name: String { get }
  var description: String { get }
  
  var scene: SCNScene { get }
}

let Games: [Game] = [
  MinimalDemo(
    name: "Minimal Demo",
    description: "Just SceneKit and SwiftUI overlay"),
  
  TBSGame(
    name: "Default TBS",
    description: "7x7 field with default set of Heroes",
    field: Field(size: 7)),
]
