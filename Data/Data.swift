//
//  Data.swift
//  JapHelper
//
//  Created by Kovs on 29.10.2020.
//

import SwiftUI
import Combine

// MARK: - Colors
extension Color {
    public static var brownColor: Color {
        return Color(red: 133 / 255, green: 94 / 255, blue: 66 / 255)
    }
    public static var redColor: Color {
        return Color(red: 220 / 255, green: 0 / 255, blue: 0 / 255)
    }
    public static var oliveGreen: Color {
        return Color(red: 85 / 255, green: 107 / 255, blue: 47 / 255)
    }
    public static var offWhite: Color {
        return Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    }
    public static var navyBlue: Color {
        return Color(red: 28 / 255, green: 46 / 255, blue: 74 / 255)
    }
}


// MARK: - Load the lesson from JSON file:
let lessonsData: [Lesson] = load("lessonsData.json")
// let dataLesson


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


// MARK: - Lessons Header Struct
struct LessonsHeader: Codable, Identifiable {
    let id: UUID
    let chapter: String
    let items: [Lesson]
    
}


// MARK: - Lesson Struct
struct Lesson: Codable, Equatable, Identifiable {
    static func == (lhs: Lesson, rhs: Lesson) -> Bool {
        if lhs.id == rhs.id {
            return true
        } else {
            return false
        }
    }
    
    let name: String
    let id: Int
    
    let chapter: String // to sort by groups
    let type: Int // to show the right lessons page
    
    fileprivate var imageName: String
    
    let info: Info
    let examples: Examples
    
    struct Examples: Codable {
        let first: First
        let second: Second
        
        //struct for the first example
        struct First: Codable {
            let word: String
            let translation: String
        }
        // struct for the second example
        struct Second: Codable {
            let word: String
            let translation: String
        }
    }
    
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
extension Lesson {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

// MARK: - Store Images

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]

    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}

