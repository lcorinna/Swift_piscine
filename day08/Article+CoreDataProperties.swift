//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Lashaun Corinna on 8/22/22.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: String?
    @NSManaged public var creation_date: Date?
    @NSManaged public var modification_date: Date?
    
    public override description: String {
            return  "language: \(language)" + "image: \(image)" + "creation date: \(creation_date)" + "title: \(title)\n" +
                    "content: \(content)\n" + "modification date: \(modification_date)"
        }

}

