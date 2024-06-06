//
//  PokemonDetailView.swift
//  PokedexApp
//
//  Created by Luis Eduardo Ramos on 24/04/2024.
//

import SwiftUI
//VISTA DETALLE
struct PokemonDetailView: View {
    
    let pokemon: PokemonModel
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: pokemon.imageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxHeight: 250)
            .shadow(radius: 12)
            
            Text(pokemon.description ?? "")
                .font(.system(size: 28))
            VStack{
                Text("type: \(pokemon.type ?? "")")
                    .font(.title2)
                HStack{
                    Text("attack: \(pokemon.defense!)")
                        .foregroundColor(.red)
                    Text("defense: \(pokemon.defense!)")
                        .foregroundColor(.green)
                }
            }
        }
        .padding(15)
        .navigationTitle(pokemon.name ?? "")
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: MockData.pokemon)
    }
}
