//
//  ExhibitionsModel.swift
//  GalleryGuide
//
//  Created by Kirill Kirikov on 6/4/17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation

class ExhibitionsModel {
    
    private (set) var exhibitions:[ExibitionVO] = []
    static var instance: ExhibitionsModel = ExhibitionsModel()
    
    func loadExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        _ = Sender().requestAllExhibitions(exhibitionsLoaded: exhibitionsLoaded)
    }
    
    func loadNearMeExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        _ = Sender().requestNearMeExhibitions(exhibitionsLoaded: exhibitionsLoaded)
    }
    
    func loadPopularExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        
        _ = Sender().requestPopularExhibitions(exhibitionsLoaded: exhibitionsLoaded)
        
    }
    
    func loadLastChanceExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        _ = Sender().requestLastChanceExhibitions(exhibitionsLoaded: exhibitionsLoaded)
    }
    
    func loadOpeningExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        _ = Sender().requestOpeningExhibitions(exhibitionsLoaded: exhibitionsLoaded)
    }
    
    func setExhibitions(exhibitions: [ExibitionVO]) {
        self.exhibitions.removeAll()
        self.exhibitions = exhibitions
    }
}
