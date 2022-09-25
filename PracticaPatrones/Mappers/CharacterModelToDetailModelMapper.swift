//
//  CharacterModelToDetailModelMapper.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 25/9/22.
//

import Foundation
protocol CharacterModelToDetailModelMapperProtocol {
    func map(_ characters: CharactersModel?) -> [DetailModel]
    func map(_ character: CharacterModel?) -> DetailModel?
}

class CharacterModelToDetailModelMapper: CharacterModelToDetailModelMapperProtocol {
    func map(_ characters: CharactersModel?) -> [DetailModel] {
        guard let characters = characters else { return [] }
        return characters.compactMap{ map($0) }
    }
    
    func map(_ character: CharacterModel?) -> DetailModel? {
        guard let character = character else { return nil}
        return DetailModel(name: character.name,
                           description: character.description,
                             image: character.image)
    }
}
