//
//  WorkVC.swift
//  galleryguide
//
//  Created by Мулярчук Константин on 02.07.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class WorkVC: UIViewController {
    
    
    @IBOutlet weak var workImage: UIImageView!
    
    @IBOutlet weak var yearOfProduce: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var ImageName: UILabel!
    @IBOutlet weak var workType: UILabel!

    var work: WorksVO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
            
        }

        self.yearOfProduce.text = work.created_at
        self.authorName.text = work.author
        self.workType.text = work.type
        self.ImageName.text = work.title
        self.workImage.image = UIImage(named: (work.imgPicture?.name)!)
    }


}
