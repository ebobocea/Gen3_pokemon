//
//  WidgetPokemon.swift
//  Gen3
//
//  Created by Elisei Bobocea on 13/01/2023.
//

import SwiftUI

enum WidgetSize{
    case small, medium, large
}


struct WidgetPokemon: View {
    @EnvironmentObject var pokemon: Pokemon
    let widgetSize: WidgetSize
    
    
    var body: some View {
        ZStack{
            Color(pokemon.types![0].capitalized)
            
            switch widgetSize {
            case .small:
                FetchedImage(url: pokemon.sprite)
            case .medium:
                HStack{
                    FetchedImage(url: pokemon.sprite)
                    VStack(alignment: .leading) {
                        Text(pokemon.name!.capitalized)
                            .font(.title2)
                        Text(pokemon.types!.joined(separator: ", ").capitalized)
                    }
                    .padding(30)
                }
            case .large:
                FetchedImage(url: pokemon.sprite)
                VStack{
                    HStack{
                        Text(pokemon.name!.capitalized)
                            .font(.largeTitle)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        Text(pokemon.types!.joined(separator: ", ").capitalized)
                            .font(.title2)
                    }
                }
                .padding()
            }
        }
    }
}

struct WidgetPokemon_Previews: PreviewProvider {
    static var previews: some View {
        WidgetPokemon(widgetSize: .medium)
            .environmentObject(SamplePokemon.samplePokemon)
    }
}
