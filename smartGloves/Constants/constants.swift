//
//  Constants.swift
//  smartGloves
//
//  Created by Gerardo on 08/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import Foundation
 
struct countryLanguageCode {
    static let mexico = "es-MX"
    static let estadosUnidos = "en-US"
    static let brazil = "pt-BR"
    static let china = "zh-Hans" // Chino simplificado
    static let rusia = "ru"
}

//struct statusSmartGloves {
//    static let active = "active"
//    static let inactive = "inactive"
//}

enum stateSmartgloves : String {
    case active = "actibbbob"
    case inactive
}

var languageCode = "es-MX"

var stateToRecvData : stateSmartgloves = .active
//var stateSmartGloves : stateSmartgloves = .active

var alphabetCalibrationData = [
    sensorsData(ax : 3427, ay : -1924, az : 15855, gx : 669, gy : 756, gz : -1437, d1 : 456, d2 : 434, d3 : 596, d4 : 618, target : "a"),
    sensorsData(ax : 12923, ay : -5024, az : 8943, gx : 343, gy : 371, gz : -1, d1 : 160, d2 : 145, d3 : 192, d4 : 181, target : "b"),
    sensorsData(ax : 12011, ay : -5456, az : 10363, gx : 79, gy : 317, gz : -868, d1 : 438, d2 : 354, d3 : 425, d4 : 191, target : "c"),
    sensorsData(ax : 343, ay : -192, az : 1234, gx : 669, gy : 756, gz : -1437, d1 : 456, d2 : 434, d3 : 596, d4 : 618, target : "d")
]

//ax = 3427    ay = -1924   az = 15855    gx = 669   gy = 756   gz = -1437, d1 = 456, d2 = 434, d3 = 596, d4 = 618
//ax : 3427, ay : -1924, az : 15855, gx : 669, gy : 756, gz : -1437, d1 : 456, d2 : 434, d3 : 596, d4 : 618, target : "a"
//ax : 12923, ay : -5024, az : 8943, gx : 343, gy : 371, gz : -1, d1 : 160, d2 : 145, d3 : 192, d4 : 181, target : "b"
//ax : 12011, ay : -5456, az : 10363, gx : 79, gy : 317, gz : -868, d1 : 438, d2 : 354, d3 : 425, d4 : 191, target : "c"
