//
//  SaveMovieVC.swift
//  MyFavoriteMovies
//
//  Created by macuser on 2/19/16.
//  Copyright © 2016 ResponseApps. All rights reserved.
//

import UIKit
import CoreData

class SaveMovieVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var txtTitle: UITextField!
    @IBOutlet var txtDescr: UITextField!
    @IBOutlet var txtLink: UITextField!
    @IBOutlet var imgMovie: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imgMovie.layer.cornerRadius = 4.0
        imgMovie.clipsToBounds = true

    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        imgMovie.image = image
    }
    
    @IBAction func btnPressed(sender: AnyObject!) {
        
        switch (sender.tag) {
        case 0:
            // add image
            
            addImage()
            
            break
        case 1:
            //save
            
            createMovieRecord()
            
            break
        case 2:
            //cancel
            
            getGone()
            
            break
        default:
            break
        }
        
    }
    
    func addImage() {
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    func createMovieRecord() {
        if let title = txtTitle.text where title != "" {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("FavMovie", inManagedObjectContext: context)!
            let favMovie = FavMovie(entity: entity, insertIntoManagedObjectContext: context)
            
            favMovie.title = txtTitle.text
            favMovie.descrWhyGood = txtDescr.text
            favMovie.linkImdb = txtLink.text
            favMovie.setImage(imgMovie.image!)
            
            context.insertObject(favMovie)
            
            do {
                try context.save()
            } catch {
                print("No savo filmo")
            }
            
            self.navigationController?.popViewControllerAnimated(true)
            
        }
    }
    
    func getGone() {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
}
