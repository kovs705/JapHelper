//
//  Word+CoreDataProperties.swift
//  JapHelper
//
//  Created by Kovs on 21.10.2020.
//
//

import Foundation
import CoreData


extension Word {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Word> {
        return NSFetchRequest<Word>(entityName: "Word")
    }

    @NSManaged public var exactWord: String?
    @NSManaged public var translation: String?
    @NSManaged public var group: Group?
    
    public var wrappedExactWord: String {
        exactWord ?? "Unknown Word"
    }

}

extension Word : Identifiable {

}
