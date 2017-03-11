//
//  ViewController.swift
//  WeatherApp
//
//  Created by Vladyslav Filippov on 09.03.17.
//  Copyright © 2017 Vladyslav Filippov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    var weather = DataModel()
    
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        weather.dowloadData {
            self.updateUI()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

 
    
    func updateUI() {
        dataLabel.text = weather.date
        tempLabel.text = "\(weather.temp)"
        locationLabel.text = weather.location
        weatherLabel.text = weather.weather
        weatherImage.image = UIImage(named: weather.weather)
    }
    

}

