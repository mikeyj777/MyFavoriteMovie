//
//  FavMovie.swift
//  MyFavoriteMovies
//
//  Created by macuser on 2/19/16.
//  Copyright © 2016 ResponseApps. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class FavMovie: NSManagedObject {

    func setImage(img:UIImage) {
        let data = UIImagePNGRepresentation(img)
        self.imgMovie = data
    }
    
    func getImg() -> UIImage {
        let img = UIImage(data: self.imgMovie!)!
        return img
    }
    
    
}
