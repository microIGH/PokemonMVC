//
//  Pokemon.swift
//  PokemonMVC
//
//  Created by ISRAEL GARCIA on 07/08/25.
//

import Foundation

struct Pokemon {
    let image: Int
    let name: String
    let movement: String
    let ability: String
    
    init(imageId: Int, name: String, movement: String, ability: String) {
        self.image = imageId
        self.name = name
        self.movement = movement
        self.ability = ability
    }
}
