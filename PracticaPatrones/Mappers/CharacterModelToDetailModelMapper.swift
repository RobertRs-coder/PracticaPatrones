//
//  CharacterModelToDetailModelMapper.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 25/9/22.
//

import Foundation
protocol CharacterModelToDetailModelMapperProtocol {
    func map(_ characters: Characters?) -> [DetailModel]
    func map(_ character: Character?) -> DetailModel?
}

class CharacterModelToDetailModelMapper: CharacterModelToDetailModelMapperProtocol {
    func map(_ characters: Characters?) -> [DetailModel] {
        guard let characters = characters else { return [] }
        return characters.compactMap{ map($0) }
    }
    
    func map(_ character: Character?) -> DetailModel? {
        guard let character = character else { return nil}
        return DetailModel(name: character.name,
                           description: character.description,
                             photo: character.photo)
    }
}
