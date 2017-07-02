//
//  ExhibitionsViewController.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 6/4/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import UIKit

class ExhibitionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    var exhibitions:[ExibitionVO]!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        ExhibitionsModel.instance.loadExhibitions(exhibitionsLoaded: tableView.reloadData)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ExhibitionsModel.instance.exhibitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.configureCell(item: ExhibitionsModel.instance.exhibitions[indexPath.row])
        let exhibition = ExhibitionsModel.instance.exhibitions[indexPath.row]
        let workName = exhibition.works?.first?.imgPicture?.name
        if workName != nil {
            cell.imageExample.image = UIImage(named: workName!)
        }else {
            cell.imageExample.image = UIImage(named: "notAviable")
        }
            
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! ItemCell
        let index = tableView.indexPath(for: cell)!
        let exhibition = ExhibitionsModel.instance.exhibitions[index.row]
        let destination = segue.destination as! DetailsViewController
        destination.exhibition = exhibition
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let scale: CGFloat = 0.45
        return self.view.frame.size.height * scale
    }
    
    @IBAction func blurViewBtn(_ sender: UIButton) {
        self.blurView.isHidden = false
        
    }
    func closeBlureView() {
        
        self.blurView.isHidden = true
        tableView.reloadData()
    }
        
    
    
    @IBAction func nearMeBtn(_ sender: UIButton) {
        ExhibitionsModel.instance.loadNearMeExhibitions(exhibitionsLoaded: closeBlureView)
    }
    @IBAction func mostPopular(_ sender: UIButton) {
        ExhibitionsModel.instance.loadPopularExhibitions(exhibitionsLoaded: closeBlureView)
    }
    @IBAction func openingBtn(_ sender: UIButton) {
        ExhibitionsModel.instance.loadOpeningExhibitions(exhibitionsLoaded: closeBlureView)
    }
    @IBAction func lastChance(_ sender: UIButton) {
        ExhibitionsModel.instance.loadLastChanceExhibitions(exhibitionsLoaded: closeBlureView)
    }
    @IBAction func allExhibitionsBtn(_ sender: UIButton) {
        ExhibitionsModel.instance.loadExhibitions(exhibitionsLoaded: closeBlureView)
    }
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        
        self.blurView.isHidden = true
    }
    
    
    
}

