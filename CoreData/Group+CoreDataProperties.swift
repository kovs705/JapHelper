//
//  Group+CoreDataProperties.swift
//  JapHelper
//
//  Created by Kovs on 21.10.2020.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var words: NSSet?
    @NSManaged public var name: String?
    
    
    public var wrappedName: String {
        name ?? "Unknown group"
    }
    
    public var groupArray: [Word] {
        let set = words as? Set<Word> ?? []
        
        return set.sorted {
            $0.wrappedExactWord < $1.wrappedExactWord
        }
    }
 

}
extension Group {
    
    @objc(addWordObject:)
    @NSManaged public func addToWord(_ value: Word)
    
    @objc(removeWordObject:)
    @NSManaged public func removeFromWord(_ value: Word)
    
    @objc(addWord:)
    @NSManaged public func addToWord(_ value: NSSet)
    
    @objc(removeWord:)
    @NSManaged public func removeFromWord(_ value: NSSet)
}

extension Group : Identifiable {

}
