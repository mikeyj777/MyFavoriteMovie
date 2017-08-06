//
//  FavMovieCell.swift
//  MyFavoriteMovies
//
//  Created by macuser on 2/19/16.
//  Copyright © 2016 ResponseApps. All rights reserved.
//

import UIKit

class FavMovieCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescr: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(movieRecord:FavMovie) {
        lblTitle.text = movieRecord.title
        lblDescr.text = movieRecord.descrWhyGood
        lblLink.text = movieRecord.linkImdb
        imgMovie.image = movieRecord.getImg()
    }
    
    
}
