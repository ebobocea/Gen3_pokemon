//
//  SamplePokemon.swift
//  Gen3
//
//  Created by Elisei Bobocea on 11/01/2023.
//

import Foundation
import CoreData

struct SamplePokemon{
    static let samplePokemon = {
        let context = PersistenceController.preview.container.viewContext
        
        let fetchRequest: NSFetchRequest<Pokemon> = Pokemon.fetchRequest()
        fetchRequest.fetchLimit = 1
        
        let results = try! context.fetch(fetchRequest)
        return results.first!
    }()
}
