//
//  CharacterModel.swift
//  PracticaPatrones
//
//  Created by Roberto Rojo Sahuquillo on 20/9/22.
//

import Foundation


typealias Characters = [Character]

//
//enum CharacterType: Decodable {
//    case heroe
//    case villain
//}

struct Character: Decodable {
    var id: String
    var name: String
    var description: String
    var photo: URL
    var favorite: Bool
//    var type: CharacterType
}

//let heroes: Characters = [Character(id: 01,
//                                              name: "Goku",
//                                              description: "Luctus ultrices volutpat semper parturient pellentesque eros egestas, velit tempor a nullam congue nibh vivamus magna, sociosqu neque ullamcorper vitae mattis leo. Lobortis venenatis ridiculus inceptos feugiat erat vestibulum potenti pulvinar ac, integer quam nisl nascetur magnis metus iaculis in habitant lectus, quis ultricies vel nisi litora varius volutpat class. Platea sapien fames primis hac cursus tempor ultrices nec ultricies, eu scelerisque luctus metus nisi nunc maecenas rhoncus elementum nibh, blandit nostra urna pharetra mus phasellus sagittis porttitor. Luctus ultrices volutpat semper parturient pellentesque eros egestas, velit tempor a nullam congue nibh vivamus magna, sociosqu neque ullamcorper vitae mattis leo. Lobortis venenatis ridiculus inceptos feugiat erat vestibulum potenti pulvinar ac, integer quam nisl nascetur magnis metus iaculis in habitant lectus, quis ultricies vel nisi litora varius volutpat class. Platea sapien fames primis hac cursus tempor ultrices nec ultricies, eu scelerisque luctus metus nisi nunc maecenas rhoncus elementum nibh, blandit nostra urna pharetra mus phasellus sagittis porttitor.",
//                                              image: "test.jpg",
//                                              type: .heroe),
//                          Character(id: 02,
//                                              name: "Gohan",
//                                              description: "The guy",
//                                              image: "test.jpg",
//                                              type: .heroe),
//                          Character(id: 03,
//                                              name: "Trunks",
//                                              description: "The guy",
//                                              image: "test.jpg",
//                                              type: .heroe),
//                          Character(id: 04,
//                                              name: "Vegeta",
//                                              description: "The guy",
//                                              image: "test.jpg",
//                                              type: .heroe),
//                          Character(id: 05,
//                                              name: "Krilin",
//                                              description: "The guy",
//                                              image: "test.jpg",
//                                              type: .heroe),
//                          Character(id: 06,
//                                              name: "Piccolo",
//
//                                              description: "The guy",
//                                              image: "test.jpg",
//                                              type: .heroe)
//]

// Create list of Villains
//let villains: Characters = [Character(id: 11,
//                                                name: "Freezer",
//                                                description: "The guy",
//                                                image: "test.jpg",
//                                                type: .villain),
//                                 Character(id: 12,
//                                                name: "Bu",
//                                                description: "The guy",
//                                                image: "test.jpg",
//                                                type: .villain),
//                                 Character(id: 13,
//                                                name: "Broly",
//                                                description: "The guy",
//                                                image: "test.jpg",
//                                                type: .villain),
//                                 Character(id: 14,
//                                                name: "Cell",
//                                                description: "The guy",
//                                                image: "test.jpg",
//                                                type: .villain),
//                                 Character(id: 15,
//                                                name: "Ginyu",
//                                                description: "The guy",
//                                                image: "test.jpg",
//                                                type: .villain),
//                                 Character(id: 16,
//                                                name: "Dabra",
//                                                description: "The guy",
//                                                image: "test.jpg",
//                                                type: .villain)
//]

//let sampleCharactersData = heroes + villains






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




//struct ResponseData: Decodable {
//    var person: [Person]
//}
//struct Person : Decodable {
//    var name: String
//    var age: String
//    var employed: String
//}
//
//func loadJson(filename fileName: String) -> [Person]? {
//    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            let jsonData = try decoder.decode(ResponseData.self, from: data)
//            return jsonData.person
//        } catch {
//            print("error:\(error)")
//        }
//    }
//    return nil
//}
