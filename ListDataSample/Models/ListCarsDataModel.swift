//
//  ListCarsDataModel.swift
//  ListDataSample
//
//  Created by ashish nakoti on 8/28/18.
//  Copyright © 2018 Evon. All rights reserved.
//

import UIKit
import ObjectMapper



class Cars: NSObject {
    
    // Reading and parsing data from local Data.json file.
    //Note: We are using local json file while one can use live JSON data.
    public func getCarsList(completion:@escaping (_ responseObject:AnyObject?, _
        error:NSError?, _ success:Bool) -> ()) {
    let url = Bundle.main.url(forResource: "Data", withExtension: "json")
    let data = NSData.init(contentsOf: url!)
    
        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            let mapper = Mapper<carsResponeModel>().map(JSONObject: object)
            completion(mapper, nil, true)
        } catch {
            completion(nil, nil, false)
        }
    }
}

// Car ResponseModel being parsed on data key.
// Creating an array of CarListDataModel
class carsResponeModel: Mappable {
    
    var carsArray: [carListDataModel]?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        carsArray <- map["data"]
    }
}

// CarlistDataModel beign parsed on various keys.
class carListDataModel: Mappable {
    
    var manufacturer: String?
    var model: String?
    var price: String?
    var wiki: String?
    var img: String?
    var imgUrl: String?
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        manufacturer <- map["manufacturer"]
        model <- map["model"]
        price <- map["price"]
        wiki <- map["wiki"]
        img <- map["img"]
        imgUrl <- map["img_url"]
    }

}
