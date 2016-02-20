//
//  FavMovie+CoreDataProperties.swift
//  MyFavoriteMovies
//
//  Created by macuser on 2/19/16.
//  Copyright © 2016 ResponseApps. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension FavMovie {

    @NSManaged var title: String?
    @NSManaged var descrWhyGood: String?
    @NSManaged var linkImdb: String?
    @NSManaged var imgMovie: NSData?

}
