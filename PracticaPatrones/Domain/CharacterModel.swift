//
//  CharacterModel.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 20/9/22.
//

import Foundation


typealias Characters = [Character]

struct Character: Decodable {
    var id: String
    var name: String
    var description: String
    var photo: URL
    var favorite: Bool
    var type: CharacterType
    
    enum CharacterType: Decodable {
        case hero
        case villain
    }
}

extension Character.CharacterType: CaseIterable { }

extension Character.CharacterType: RawRepresentable {
  typealias RawValue = String
  
  init?(rawValue: RawValue) {
    switch rawValue {
    case "hero": self = .hero
    case "villain": self = .villain
    default: return nil
    }
  }
  
  var rawValue: RawValue {
    switch self {
    case .hero: return "heroe"
    case .villain: return "villain"
    }
  }
}

extension Character {
  static func createCharacters() -> Characters {
    guard
        let path = Bundle.main.path(forResource: "heroes", ofType: "json"),
      let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
      else {
        return []
    }

    do {
      let decoder = JSONDecoder()
        return try decoder.decode(Characters.self, from: data)
    } catch {
      return []
    }
  }
}

var sampleCharactersData = Character.createCharacters()
