//
//  NetworkManager.swift
//  PokedexApp
//
//  Created by Luis Eduardo Ramos on 18/04/2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    static let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init () {}
    
    func getListOfPokemon(completed: @escaping (Result<[PokemonModel], APError>) -> Void ){
        
        guard let url = URL(string: NetworkManager.baseURL) else {
            completed(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data?.parseData(removeString: "null,") else {
                completed(.failure(.decodingError))
                return
            }
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([PokemonModel].self, from: data)
                completed(.success(decodedResponse))
            }catch {
                print("debug: error\(error.localizedDescription)")
            }
        }
        task.resume()
    }
}
extension Data {
    func parseData(removeString word: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: word, with: "")
        guard let data = parseDataString?.data(using: .utf8) else {return nil }
        return data
    }
}
struct MockData {
    static let pokemon = PokemonModel(id: 123, attack: 99, description: "un pokemon", defense: 99, imageURL: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", name: "eve", type: "poison")
}
