//
//  functions.swift
//  getGreener
//
//  Created by Viktor Vestlund on 2020-12-03.
//

import SwiftUI

let transportMode = ["Gång", "Cykel", "Bil", "Buss", "Tåg"]

func transportCO2Calc (_ transportationMode:String) -> Double {
    print(transportationMode)
    return 1.0
}

let test = transportCO2Calc(transportMode[0])

