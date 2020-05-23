//
//  sensorsData.swift
//  smartGloves
//
//  Created by Gerardo on 22/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import Foundation

final class sensorsData : Codable {
//    var ax : String
//    var ay : String
//    var az : String
//    var gx : String
//    var gy : String
//    var gz : String
//    var d1 : String
//    var d2 : String
//    var d3 : String
//    var d4 : String
    var ax : Int
    var ay : Int
    var az : Int
    var gx : Int
    var gy : Int
    var gz : Int
    var d1 : Int
    var d2 : Int
    var d3 : Int
    var d4 : Int
    var target : String
    
//    init(ax : String, ay : String, az : String, gx : String, gy : String, gz : String, d1 : String, d2 : String, d3 : String, d4 : String, target : String) {
    init(ax : Int, ay : Int, az : Int, gx : Int, gy : Int, gz : Int, d1 : Int, d2 : Int, d3 : Int, d4 : Int, target : String) {
        self.ax = ax
        self.ay = ay
        self.az = az
        self.gx = gx
        self.gy = gy
        self.gz = gz
        self.d1 = d1
        self.d2 = d2
        self.d3 = d3
        self.d4 = d4
        self.target = target
    }
    
}
