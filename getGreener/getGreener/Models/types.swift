//
//  functions.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-03.
//

import SwiftUI

struct Transport {
    var transportMode = ["Gång", "Cykel", "Bil", "Buss", "Tåg"]
    
    var bike = 0.0
    var carValues = [0.15812, 0.19028, 0.23048, 0.27068]
    var walk = 0.0
    var bus = 0.027
    var train = 0.01
    
    func transportCO2Calc (_ mode:String, _ length:Double, _ carSize:String = "medium", _ numPeople:Double = 1) -> Double {
        var sum = 0.0
        var carValue: Double
        
        if mode == "Bil" {
            if carSize == "medium" {
                carValue = self.carValues[1]
            }
        }
        
        sum = (self.bus * length) / numPeople
        
        return sum
    }
    
}


struct Food {
    // kg CO2 per portion
    let neutkott = 4.0
    let flask = 0.7
    let linser = 0.1
    let kyckling = 0.4
    let firre = 0.2
    let kottersattning = 0.1
    let egg = 0.1 // per ägg
    let tatersAndCarrots = 0.02
    let mjolAndGryn = 0.1
    let ris = 0.3
    let pasta = 0.1
    let greensakes = 0.1
    let eoust = 0.2
    let breoud = 0.1
    
    func calc(_ matrate:Array<Double>) -> Double {
        let sum = self.neutkott * matrate[0] + self.tatersAndCarrots * matrate[1] + self.greensakes * matrate[2]
        return sum
    }
}

struct Consumation {
    // 1kg elprodukter motsvarar ungefär 55kg co2 , 1 kg textil motsvarar ungefär 36kg co2,
    // t-shirt=4,5 kg, jeans 13kg, fleecetröja=11kg, poleysterklänning= 17kg
    //  Ny telefon=75-90kg koldioxid Tv=ungefär de dubbla
    let tshirt = 4.5
    let jeans = 13.0
    let kleening = 17.0
    let fleece = 11.0
    let phone = Array(75...90)
    let tv = 150.0
    
    func test() -> Void {
        print(phone)
    }
    
    
}

struct Questions {
    let a = 1.0
}

struct Living {
    let b = 1.0
}
