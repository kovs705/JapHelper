//
//  Data.swift
//  JapHelper
//
//  Created by Kovs on 29.10.2020.
//

import SwiftUI

// MARK: - Loading from JSON
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
// MARK: - Lesson Struct
struct LessonInfo: Codable {
    let lessond: [Lesson]
    
}
struct Lesson: Codable {
    let name: String
    let info: Info
    
    struct Info: Codable {
        let level: Level
        let text: String
        let additionalInfo: String
        
        enum Level: String, Hashable, CaseIterable, Codable {
            case N5 = "N5"
                case N4 = "N4"
                    case N3 = "N3"
                        case N2 = "N2"
                            case N1 = "N1"
                            
        }
    }
}



