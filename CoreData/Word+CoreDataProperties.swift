//
//  Word+CoreDataProperties.swift
//  JapHelper
//
//  Created by Kovs on 26.07.2021.
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
        exactWord ?? "Unknown word"
    }
    public var wrappedTranslation: String {
        translation ?? "Unknown translation"
    }

}

extension Word : Identifiable {

}
