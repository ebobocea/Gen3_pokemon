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
    var hp: Int = 0
    var attack: Int = 0
    var defence: Int = 0
    var specialAttack: Int = 0
    var specialDefence: Int = 0
    var speed: Int = 0
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
        //Main container
        let container = try decoder.container(keyedBy: PokemonKeys.self)
        
        
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        
        //Var for types
        var decodedTypes: [String] = []
        
        var typesContainer = try container.nestedUnkeyedContainer(forKey: .types)
        while !typesContainer.isAtEnd {
            let typesDictionaryContainer = try typesContainer.nestedContainer(keyedBy: PokemonKeys.TypeDictionaryKeys.self)
            
            let typeContainer =  try typesDictionaryContainer.nestedContainer(keyedBy: PokemonKeys.TypeDictionaryKeys.TypeKeys.self, forKey: .type)
            
            let type = try typeContainer.decode(String.self, forKey: .name)
            
            decodedTypes.append(type)
        }
        //Types done
        self.types = decodedTypes
        
        //Stats
        var statsContainer = try container.nestedUnkeyedContainer(forKey: .stats)
        while !statsContainer.isAtEnd {
            let statsDictionaryContainer = try statsContainer.nestedContainer(keyedBy: PokemonKeys.StatDictinaryKeys.self)
            let statContainer = try statsDictionaryContainer.nestedContainer(keyedBy: PokemonKeys.StatDictinaryKeys.StatKeys.self, forKey: .stat)
            
            switch try statContainer.decode(String.self, forKey: .name){
            case "hp":
                self.hp = try statsDictionaryContainer.decode(Int.self, forKey: .value)
            case "attack":
                self.attack =  try statsDictionaryContainer.decode(Int.self, forKey: .value)
            case "defence":
                self.defence = try statsDictionaryContainer.decode(Int.self, forKey: .value)
            case "specialAttack":
                self.specialAttack = try statsDictionaryContainer.decode(Int.self, forKey: .value)
            case "specialDefence":
                self.specialDefence = try statsDictionaryContainer.decode(Int.self, forKey: .value)
            case "speed":
                self.speed = try statsDictionaryContainer.decode(Int.self, forKey: .value)
                
            default:
                print("not found")
            }
            
        }
        
        let spritesContainer = try container.nestedContainer(keyedBy: PokemonKeys.SpritesKeys.self, forKey: .sprites)
        self.sprite = try spritesContainer.decode(URL.self, forKey: .sprite)
        self.shiny = try spritesContainer.decode(URL.self, forKey: .shiny)
        
    }
}
