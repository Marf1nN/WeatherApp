//
//  DataModel.swift
//  WeatherApp
//
//  Created by Vladyslav Filippov on 10.03.17.
//  Copyright © 2017 Vladyslav Filippov. All rights reserved.
//

import Foundation
import Alamofire

class DataModel {
    
    
    private var _date: Double!
    private var _temp: String!
    private var _location: String!
    private var _weather: String!
    typealias  JSONStandard = Dictionary<String, AnyObject>
    
    
    let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Portland&appid=a7bbbd5e82c675f805e7ae084f742024")!
    
    
    
    func dowloadData(completed : @escaping ()-> ()) {
        
        Alamofire.request(url).responseJSON(completionHandler: {
            responce in
            let result = responce.result
            
            
            if let dict = result.value as? JSONStandard, let main = dict["main"] as? JSONStandard, let temp = main["temp"] as? Double, let weatherArray = dict["weather"] as? [JSONStandard], let weather = weatherArray[0]["main"] as? String, let name = dict["name"] as? String, let sys = dict["sys"] as? JSONStandard, let country = sys["country"] as? String, let dt = dict["dt"] as? Double {
                
                self._temp = String(format: "%.0f °C", temp - 273.15)
                self._weather = weather
                self._location = "\(name), \(country)"
                self._date = dt
                 print(dict)
                
            }
           
            
            completed()
        })
        
        
    }
    
    
    
    var date: String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateStyle = .long
        dataFormatter.timeStyle = .none
        let data = Date(timeIntervalSince1970: _date!)
    
        return (_date != nil) ? "Today, \(dataFormatter.string(from: data))" : "Date Invalid"
        
        
    }
    
    var temp : String
    {
        return _temp ?? "0 °C"
    }
    
    var location : String {
        
        return _location ?? "Location Invalid"
        
    }
    
    var weather : String {
        
        return _weather ?? "Weather Invalid"
        
    }
    
}
