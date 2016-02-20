//
//  MovieDetailsVC.swift
//  MyFavoriteMovies
//
//  Created by macuser on 2/19/16.
//  Copyright © 2016 ResponseApps. All rights reserved.
//

import UIKit
import CoreData

class MovieDetailsVC: UIViewController {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescr: UILabel!
    @IBOutlet var lblLink: UILabel!
    @IBOutlet var imgMovie: UIImageView!
    
    
    var movieRecord:FavMovie!
    
    var favMovies = [FavMovie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchAndSetResult()
        
        
        
    }
    
    func fetchAndSetResult() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "FavMovie")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.favMovies = results as! [FavMovie]
        } catch let err as NSError {
            print(err.description)
        }
        
        if let row = NSUserDefaults.standardUserDefaults().objectForKey("movieRow") as? Int {
            
            self.movieRecord = self.favMovies[row]
            
            configureCell()
            
        }
        
        
    }
    
    func configureCell() {
        lblTitle.text = self.movieRecord.title
        lblDescr.text = self.movieRecord.descrWhyGood
        lblLink.text = self.movieRecord.linkImdb
        imgMovie.image = self.movieRecord.getImg()
    }

}
