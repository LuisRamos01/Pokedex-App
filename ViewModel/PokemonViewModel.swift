//
//  PokemonViewModel.swift
//  PokedexApp
//
//  Created by Luis Eduardo Ramos on 19/04/2024.
//

import Foundation

class pokemonViewModel: ObservableObject {
    
    @Published var listPokemon = [PokemonModel]()
    @Published var filteredPokemon = [PokemonModel]()
    
    init() {
        getListPokemon()
    }
    func getListPokemon() {
        NetworkManager.shared.getListOfPokemon { result in
            DispatchQueue.main.async {
                
                switch result {
                    
                case .success(let listPokemon):
                    print("listPokemon: \(listPokemon.count)")
                    self.listPokemon = listPokemon
                    self.filteredPokemon = listPokemon
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
    func filterPokemon(name: String) {
        if name.isEmpty {
            filteredPokemon = listPokemon
        } else {
            filteredPokemon = listPokemon.filter({ pokemon in
                pokemon.name!.lowercased().contains(name.lowercased())
                
            })
        }
    }
}
