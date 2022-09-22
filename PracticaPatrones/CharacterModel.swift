//
//  CharacterModel.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 20/9/22.
//

import Foundation


typealias CharactersModel = [CharacterModel]


enum CharacterType {
    case heroe
    case villain
}

struct CharacterModel {
    var id: Int
    var name: String
    var description: String
    var image: String?
    var type: CharacterType
}

let heroes: CharactersModel = [CharacterModel(id: 01,
                                              name: "Goku",
                                              description: "The guy",
                                              image: "test.jpg",
                                              type: .heroe),
                               CharacterModel(id: 02,
                                              name: "Gohan",
                                              description: "The guy",
                                              image: "test.jpg",
                                              type: .heroe),
                               CharacterModel(id: 03,
                                              name: "Trunks",
                                              description: "The guy",
                                              image: "test.jpg",
                                              type: .heroe),
                               CharacterModel(id: 04,
                                              name: "Vegeta",
                                              description: "The guy",
                                              image: "test.jpg",
                                              type: .heroe),
                               CharacterModel(id: 05,
                                              name: "Krilin",
                                              description: "The guy",
                                              image: "test.jpg",
                                              type: .heroe),
                               CharacterModel(id: 06,
                                              name: "Piccolo",
    
                                              description: "The guy",
                                              image: "test.jpg",
                                              type: .heroe)
]

// Create list of Villains
let villains: CharactersModel = [CharacterModel(id: 11,
                                                name: "Freezer",
                                                description: "The guy",
                                                image: "test.jpg",
                                                type: .villain),
                                 CharacterModel(id: 12,
                                                name: "Bu",
                                                description: "The guy",
                                                image: "test.jpg",
                                                type: .villain),
                                 CharacterModel(id: 13,
                                                name: "Broly",
                                                description: "The guy",
                                                image: "test.jpg",
                                                type: .villain),
                                 CharacterModel(id: 14,
                                                name: "Cell",
                                                description: "The guy",
                                                image: "test.jpg",
                                                type: .villain),
                                 CharacterModel(id: 15,
                                                name: "Ginyu",
                                                description: "The guy",
                                                image: "test.jpg",
                                                type: .villain),
                                 CharacterModel(id: 16,
                                                name: "Dabra",
                                                description: "The guy",
                                                image: "test.jpg",
                                                type: .villain)
]

let sampleCharactersData: CharactersModel = heroes + villains
