//
//  PokemonModel.swift
//  PokedexApp
//
//  Created by Luis Eduardo Ramos on 18/04/2024.
//

import Foundation

cdstruct PokemonModel: Codable, Hashable {
   
    let id: Int?
    let attack: Int?
    let description: String?
    let defense: Int?
    let imageURL: String?
    let name: String?
    let type: String?
    
}
