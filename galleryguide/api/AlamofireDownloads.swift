//
//  AlamofireDownloads.swift
//  galleryguide
//
//  Created by Мулярчук Константин on 29.06.17.
//  Copyright © 2017 Seductive. All rights reserved.
//

import Foundation
import SDWebImage
import Alamofire
import AlamofireObjectMapper


class Sender {
    
    func requestAllExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions").responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                exhibitionsLoaded()
                print(result)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func requestOpeningExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions/opening").responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                exhibitionsLoaded()
                print(result.count)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func requestLastChanceExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions/lastchance").responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                print(result.count)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func requestPopularExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions/popular").responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                exhibitionsLoaded()
                print(result.count)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func requestNearMeExhibitions(exhibitionsLoaded:@escaping () -> Void) {
        Alamofire.request("https://gallery-guru-prod.herokuapp.com/exhibitions/near").responseArray {
            (response: DataResponse<[ExibitionVO]>) in
            switch response.result {
            case .success(let result):
                ExhibitionsModel.instance.setExhibitions(exhibitions: result)
                exhibitionsLoaded()
                print(result.count)
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    
}
