//
//  CharacterModelToHomeCellModelMapper.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 25/9/22.
//

import Foundation

protocol CharacterModelToHomeCellModelMapperProtocol {
    func map(_ characters: CharactersModel?) -> [HomeCellModel]
    func map(_ character: CharacterModel?) -> HomeCellModel?
}
    
class CharacterModelToHomeCellModelMapper {
    func map(_ characters: CharactersModel?) -> [HomeCellModel] {
        guard let characters = characters else { return [] }
        return characters.compactMap{ map($0) }
    }
    
    func map(_ character: CharacterModel?) -> HomeCellModel? {
        guard let character = character else { return nil}
        return HomeCellModel(name: character.name,
                             image: character.image)
    }
}
