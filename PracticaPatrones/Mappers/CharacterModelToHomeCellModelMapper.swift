//
//  CharacterModelToHomeCellModelMapper.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 25/9/22.
//

import Foundation

protocol CharacterModelToHomeCellModelMapperProtocol {
    func map(_ characters: [Character]?) -> [HomeCellModel]
    func map(_ character: Character?) -> HomeCellModel?
}
class CharacterModelToHomeCellModelMapper: CharacterModelToHomeCellModelMapperProtocol {
    func map(_ characters: [Character]?) -> [HomeCellModel] {
        guard let characters = characters else { return [] }
        return characters.compactMap{ map($0) }
    }
    
    func map(_ character: Character?) -> HomeCellModel? {
        guard let character = character else { return nil}
        return HomeCellModel(name: character.name,
                             photo: character.photo,
                             type: character.type)
    }
}
