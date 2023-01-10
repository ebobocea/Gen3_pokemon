//
//  TempPokemon.swift
//  Gen3
//
//  Created by Elisei Bobocea on 10/01/2023.
//

import Foundation


struct TempPokemon: Codable{
    let id: Int
    let name: String
    let types: [String]
    let hp: Int
    let attack: Int
    let defence: Int
    let specialAttack: Int
    let specialDefence: Int
    let speed: Int
    let sprite: URL
    let shiny: URL
    
    enum PokemonKeys: String, CodingKey {
        case id
        case name
        case types
        case stats
        case sprites
        
        enum TypeDictionaryKeys: String, CodingKey {
            case type
            
            enum TypeKeys: String, CodingKey {
                case name
            }
        }
        
        enum StatDictinaryKeys: String, CodingKey {
            case value = "base_stat"
            case stat
            
            enum StatKeys: String, CodingKey {
                case name
            }
        }
        
        enum SpritesKeys: String, CodingKey {
            case sprite = "front_defaul"
            case shiny = "front_shiny"
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PokemonKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        var decodedTypes: [String] = []
        var typesContainer = try container.nestedUnkeyedContainer(forKey: .types)
        while !typesContainer.isAtEnd {
            let typesDictionaryContainer = try typesContainer.nestedContainer(keyedBy: PokemonKeys.TypeDictionaryKeys.self)
            let typeContainer =  try typesDictionaryContainer.nestedContainer(keyedBy: PokemonKeys.TypeDictionaryKeys.TypeKeys.self, forKey: .type)
        }
        
        
        
        self.types = try container.decode([String].self, forKey: .types)
        
        
        self.hp = try container.decode(Int.self, forKey: .hp)
        self.attack = try container.decode(Int.self, forKey: .attack)
        self.defence = try container.decode(Int.self, forKey: .defence)
        self.specialAttack = try container.decode(Int.self, forKey: .specialAttack)
        self.specialDefence = try container.decode(Int.self, forKey: .specialDefence)
        self.speed = try container.decode(Int.self, forKey: .speed)
        self.sprite = try container.decode(URL.self, forKey: .sprite)
        self.shiny = try container.decode(URL.self, forKey: .shiny)
    }
}
