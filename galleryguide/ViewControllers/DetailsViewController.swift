//
//  DetailsViewController.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 6/4/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var scrolView: UIScrollView!
    @IBOutlet weak var citiNameLbl: UILabel!
    @IBOutlet weak var authorNameLbl: UILabel!
    @IBOutlet weak var galleryNameLbl: UILabel!
    
    @IBOutlet weak var galleryLbl: UILabel!
    
    @IBOutlet weak var galleryDetailsLbl: UILabel!
    @IBOutlet weak var startWorkingLbl: UILabel!
    @IBOutlet weak var closeLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var facebookLbl: UILabel!
    
    @IBOutlet weak var deskriptionLbl: UILabel!
    @IBOutlet weak var urlLinkLbl: UIView!
    
    @IBOutlet weak var aboutLbl: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    public var exhibition : ExibitionVO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrolView.contentSize.height = 1000
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
            
        }
        
        galleryNameLbl.text = exhibition.name
        authorNameLbl.text = exhibition.authourName
        citiNameLbl.text = exhibition.gallery.city
        galleryLbl.text = exhibition.gallery.name
        galleryDetailsLbl.text = exhibition.gallery.galleryDescript
        startWorkingLbl.text = exhibition.gallery.schedule
        locationLbl.text = exhibition.gallery.address
        phoneNumber.text = exhibition.gallery.phone
        facebookLbl.text = exhibition.gallery.facebook
        deskriptionLbl.text = exhibition.authourDeskript
        aboutLbl.text = exhibition.details
        
    
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if exhibition.works != nil {
        return exhibition.works!.count
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorksCell", for: indexPath) as! WorksCell
        if exhibition.works != nil {
            let image = exhibition.works![indexPath.row]
            let imageName = image.imgPicture!.name
            cell.worksImage.image = UIImage(named: imageName!)
            return cell
        }
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! WorksCell
        let index = collectionView.indexPath(for: cell)!
        let work = exhibition.works?[index.row]
        let destination = segue.destination as! WorkVC
        destination.work = work
        
    }

    


}
