//
//  FavMovieCell.swift
//  MyFavoriteMovies
//
//  Created by macuser on 2/19/16.
//  Copyright © 2016 ResponseApps. All rights reserved.
//

import UIKit

class FavMovieCell: UITableViewCell {

    @IBOutlet var imgMovie: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDescr: UILabel!
    @IBOutlet var lblLink: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

    func configureCell(movieRecord:FavMovie) {
        lblTitle.text = movieRecord.title
        lblDescr.text = movieRecord.descrWhyGood
        lblLink.text = movieRecord.linkImdb
        imgMovie.image = movieRecord.getImg()
    }
    
}
