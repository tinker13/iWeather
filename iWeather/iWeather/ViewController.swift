//
//  ViewController.swift
//  iWeather
//
//  Created by hungtran on 6/7/17.
//  Copyright © 2017 hungtran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lbl_temp: UILabel!
    
    
    @IBOutlet weak var lbl_city: UILabel!
    
    
    @IBOutlet weak var lbl_quote: UILabel!
    
    
    @IBOutlet weak var lbl_tempNumber: UILabel!
    
    
    @IBOutlet weak var img_background: UIImageView!
    
    var quote = ["PINOY DOTO BEST DOTO", "VODKA DOTO BEST DOTO", "VIETNOY DOTO BEST DOTO"]
    
    var city = ["Hanoi", "DaNang", "HoChiMinhCity"]
    
    var backgroundImage = ["Blood", "Moon", "Sun"]
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    // Lay bat ky doi tuong nao trong 1 mang
    @IBAction func action_random(_ sender: Any) {
        //ramdom city
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        lbl_city.text = city[cityIndex]
        //random quote
        let quoteIndex = Int(arc4random_uniform(UInt32(quote.count)))
        lbl_quote.text = quote[quoteIndex]
        //random background
        let imgIndex = Int(arc4random_uniform(UInt32(backgroundImage.count)))
        
        img_background.image = UIImage.init(named: backgroundImage[imgIndex])
        
        getTemp()
    }
    
    @IBAction func action_changeTemp(_ sender: Any) {
        changeTemp()
    }
    
    func getTemp() -> Void {
        let randomNumber = String(format: "%2.1f", tempRandom())
        
        lbl_tempNumber.text = randomNumber
    }
    
    //random nhiet do
    func tempRandom() -> Double {
        if lbl_temp.text == "C"{
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        }else{
            return (Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)) * 9/5 + 32
        
    }
    }
    //change temp
    func changeTemp()  {
        var cToC:Double = 0
        var cToF:Double = 0
        if lbl_temp.text == "C" {
            cToC = Double(lbl_tempNumber.text!)! * 9/5+32
            lbl_tempNumber.text = String(format: "%2.1f", cToF)
            lbl_temp.text = "F"
            
            
        }else{
            cToC = (Double(lbl_tempNumber.text!)! - 32) * 5/9
            lbl_temp.text = "C"
        }
        
    }
    
    }
    
