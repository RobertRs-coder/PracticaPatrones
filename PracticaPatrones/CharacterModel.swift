//
//  CharacterModel.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 20/9/22.
//

import Foundation


typealias CharactersModel = [CharacterModel]


struct CharacterModel {
    var image: String?
    var name: String
    var lastname: String
    var score: Float = 0.0
}

let sampleCharactersData: CharactersModel = [
    CharacterModel(image: "img_rachel",
                   name: "Rachel",
                   lastname: "Green",
                   score: 10.0),
    CharacterModel(image: "img_ross",
                   name: "Ross",
                   lastname: "Geller",
                   score: 9.8),
    CharacterModel(image: "img_monica",
                   name: "Monica",
                   lastname: "Geller",
                   score: 9.0),
    CharacterModel(image: "img_chandler",
                   name: "Chandler",
                   lastname: "Bing",
                   score: 8.0),
    CharacterModel(image: "img_joey",
                   name: "Joey",
                   lastname: "Tribbiani",
                   score: 9.2),
    CharacterModel(image: "img_phoebe",
                   name: "Phoebe",
                   lastname: "Buffay",
                   score: 8.5)
]

