//
//  ContentView.swift
//  PokedexApp
//
//  Created by Luis Eduardo Ramos on 18/04/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = pokemonViewModel()
    @State private var pokemonToSearch = ""
    private let numberOfColums = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: numberOfColums) {
                    ForEach(viewModel.filteredPokemon, id: \.self) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            pokemonCellView(pokemon: pokemon)
                        }
                    }
                } .padding(20)
                    .searchable(text: $pokemonToSearch, prompt: "search pokemon")
                    .onChange(of: pokemonToSearch) { newValue in
                        withAnimation {
                        }
                    }
            }.navigationBarTitle("pokedex", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct pokemonCellView: View {
    
    let pokemon: PokemonModel
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.orange)
                .cornerRadius(25)
            
            VStack{
                AsyncImage(url: URL(string: pokemon.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100,height: 100)
                .shadow(radius: 12)
                
                Text(pokemon.name ?? "" )
                    .font(.body)
                    .foregroundColor(.white)
            }
        }
    }
}
