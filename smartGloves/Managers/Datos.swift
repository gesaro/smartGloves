//
//  Datos.swift
//  smartGloves
//
//  Created by Gerardo on 05/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import Foundation

final class Datos: Codable {
    var id:Int?
    
    
    var usuario:String
    var password:String

    
    init(usuario:String, password: String){
        self.usuario = usuario
        self.password = password
    }
}




final class smart: Codable {

    var mensaje:String
    
    init(mensaje:String){
        self.mensaje = mensaje
    }
}
