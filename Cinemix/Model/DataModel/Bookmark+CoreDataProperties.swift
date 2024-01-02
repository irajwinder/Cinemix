//
//  Bookmark+CoreDataProperties.swift
//  Cinemix
//
//  Created by Rajwinder Singh on 1/1/24.
//
//

import Foundation
import CoreData


extension Bookmark {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Bookmark> {
        return NSFetchRequest<Bookmark>(entityName: "Bookmark")
    }

    @NSManaged public var bookmarkMovie: String?
    @NSManaged public var bookmarkMusic: String?

}

extension Bookmark : Identifiable {

}
