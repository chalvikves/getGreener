//
//  functions.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-03.
//

import SwiftUI

class Transport {
    var transportMode = ["Gång", "Cykel", "Bil", "Buss", "Tåg"]
    
    var bike = 0.0
    var carValues = [0.15812, 0.19028, 0.23048, 0.27068]
    var walk = 0.0
    var bus = 0.027
    var train = 0.01
    
    func transportCO2Calc (_ mode:String, _ length:Double, _ carSize:String = "medium", _ numPeople:Double = 1) -> Double {
        var sum = 0.0
        var carValue = 0.0
        
        if mode == "Bil" {
            if carSize == "medium" {
                carValue = self.carValues[1]
            }
        }
        
        sum = (self.bus * length) / numPeople
        
        return sum
    }
    
}


class Food {
    // kg CO2 per portion
    var neutkott = 4.0
    var flask = 0.7
    var linser = 0.1
    var kyckling = 0.4
    var firre = 0.2
    var kottersattning = 0.1
    var egg = 0.1 // per ägg
    var tatersAndCarrots = 0.02
    var mjolAndGryn = 0.1
    var ris = 0.3
    var pasta = 0.1
    var greensakes = 0.1
    var eoust = 0.2
    var breoud = 0.1
    
    func calc(_ matrate:Array<Double>) -> Double {
        let sum = self.neutkott * matrate[0] + self.tatersAndCarrots * matrate[1] + self.greensakes * matrate[2]
        return sum
    }
}
