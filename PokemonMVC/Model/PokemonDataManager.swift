//
//  PokemonDataManager.swift
//  PokemonMVC
//
//  Created by ISRAEL GARCIA on 07/08/25.
//

import Foundation

class PokemonDataManager {
    private var pokemons: [Pokemon] = []
    private var hasLoaded = false
    
    private let pokemonData: [(id: Int, name: String, movement: String, ability: String)] = [
        (0, "Wartortle", "Water Gun", "Torrent"),
        (1, "Bulbasaur", "Vine Whip", "Overgrow"),
        (2, "Blastoise", "Hydro Pump", "Torrent"),
        (3, "Butterfree", "Gust", "Compound Eyes"),
        (4, "Ivysaur", "Razor Leaf", "Overgrow"),
        (5, "Jigglypuff", "Sing", "Cute Charm"),
        (6, "Charmander", "Ember", "Blaze"),
        (7, "Meowth", "Scratch", "Pickup"),
        (8, "Alakazam", "Psychic", "Synchronize"),
        (9, "Pidgeotto", "Quick Attack", "Keen Eye"),
        (10, "Raichu", "Thunderbolt", "Static"),
        (11, "Rattata", "Tackle", "Run Away"),
        (12, "Vaporeon", "Water Pulse", "Water Absorb"),
        (13, "Jynx", "Ice Beam", "Oblivious"),
        (14, "Venusaur", "Solar Beam", "Overgrow"),
        (15, "Vulpix", "Flame Thrower", "Flash Fire"),
        (16, "Slowbro", "Confusion", "Oblivious"),
        (17, "Seel", "Ice Beam", "Thick Fat"),
        (18, "Fearow", "Drill Peck", "Keen Eye"),
        (19, "Wigglytuff", "Body Slam", "Cute Charm"),
        (20, "Scyther", "Slash", "Swarm"),
        (21, "Golduck", "Confusion", "Damp"),
        (22, "Lapras", "Ice Beam", "Water Absorb"),
        (23, "Sandshrew", "Sand Attack", "Sand Veil")
    ]
    
    func fetch() {
        guard !hasLoaded else {
            print("Datos ya cargados previamente")
            return
        }
        
        // Ordena por ID
        let sortedData = pokemonData.sorted { $0.id < $1.id }
        
        for pokemonInfo in sortedData {
            let pokemon = Pokemon(
                imageId: pokemonInfo.id,
                name: pokemonInfo.name,
                movement: pokemonInfo.movement,
                ability: pokemonInfo.ability
            )
            pokemons.append(pokemon)
        }
        
        hasLoaded = true
        print("Cargados \(pokemons.count) pokémons")
    }
    
    func getPokemon(at index: Int) -> Pokemon {
        return pokemons[index]
    }
    
    func count() -> Int {
        return pokemons.count
    }
}
