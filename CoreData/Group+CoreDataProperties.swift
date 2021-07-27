//
//  Group+CoreDataProperties.swift
//  JapHelper
//
//  Created by Kovs on 26.07.2021.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var name: String?
    @NSManaged public var words: NSSet?
    
    public var wrappedName: String {
        name ?? "Unknown group"
    }
    
    public var wordsArray: [Word] {
        let set = words as? Set<Word> ?? []
        
        return set.sorted {
            $0.wrappedExactWord < $1.wrappedExactWord
        }
    }

}

// MARK: Generated accessors for words
extension Group {

    @objc(addWordsObject:)
    @NSManaged public func addToWords(_ value: Word)

    @objc(removeWordsObject:)
    @NSManaged public func removeFromWords(_ value: Word)

    @objc(addWords:)
    @NSManaged public func addToWords(_ values: NSSet)

    @objc(removeWords:)
    @NSManaged public func removeFromWords(_ values: NSSet)

}

extension Group : Identifiable {

}
