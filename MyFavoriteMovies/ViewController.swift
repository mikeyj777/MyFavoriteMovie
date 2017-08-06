//
//  ViewController.swift
//  MyFavoriteMovies
//
//  Created by macuser on 2/19/16.
//  Copyright © 2016 ResponseApps. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var favMovies = [FavMovie]()
    var fetchedResultsController: NSFetchedResultsController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "FavMovie")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.favMovies = results as! [FavMovie]
        } catch let err as NSError {
            print(err.description)
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("FavMovieCell") as? FavMovieCell {
            let movieRecord = favMovies[indexPath.row]
            
            cell.configureCell(movieRecord)
            return cell
        } else {
            return FavMovieCell()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favMovies.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        NSUserDefaults.standardUserDefaults().setObject(indexPath.row, forKey: "movieRow")
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
        let movieDetailsVC = MovieDetailsVC()
        
        self.navigationController?.presentViewController(movieDetailsVC, animated: true, completion: nil)
        
    }
    
}

