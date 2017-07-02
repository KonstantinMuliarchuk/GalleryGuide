//
//  Cell.swift
//  galleryguide
//
//  Created by Мулярчук Константин on 29.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var galleryName: UILabel!
    @IBOutlet weak var imageExample: UIImageView!

    
    func configureCell(item: ExibitionVO) {
        
        cityName.text = item.gallery.city
        authorName.text = item.authourName
        galleryName.text = item.gallery.name
        
        
        
    }
}



