//
//  testBluetoothViewController.swift
//  smartGloves
//
//  Created by Gerardo on 06/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit
import CoreBluetooth

class testBluetoothViewController: BaseDarkViewController {
    
    var centralManager : CBCentralManager!
    
    var smartGlovesPeripherals : CBPeripheral!

    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    

}

//CBPeripheralDelegate metodo delegado para descubrir los servicios de un periferico

extension testBluetoothViewController : CBCentralManagerDelegate, CBPeripheralDelegate {
    //funcion necesaria dentro de CBCentralDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        //Switch que muestra todos los posibles estados del bluetooth en el dispositivo
        switch central.state {
            case .unknown:
                print("central.state is .unknown")
            case .resetting:
              print("central.state is .resetting")
            case .unsupported:
              print("central.state is .unsupported")
            case .unauthorized:
              print("central.state is .unauthorized")
            case .poweredOff:
              print("central.state is .poweredOff")
            case .poweredOn:
              print("central.state is .poweredOn")
              //Sabiendo que el bluetooth esta encendido comienza en escaneo
              centralManager.scanForPeripherals(withServices: nil)
            @unknown default:
                print("defaul")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        //mostrara todos los dispositivos bluetooth cerca
        //<CBPeripheral: 0x1c4105fa0, identifier = D69A9892-...21E4, name = Your Computer Name, state = disconnected>
        //<CBPeripheral: 0x1c010a710, identifier = CBE94B09-...0C8A, name = Tile, state = disconnected>
        print(peripheral)
        
        //una vez que se encuantre el periferico se guarda una referencia de deja de escanear
        smartGlovesPeripherals = peripheral
        smartGlovesPeripherals.delegate = self
        centralManager.stopScan()
        
        //Para obtener datos
        centralManager.connect(smartGlovesPeripherals)
    }
    
    //funcion para verificar que se conecto correctamente
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Conecatado!")
        //Para descubiri los servicios del periferico
        smartGlovesPeripherals.discoverServices(nil)
    }
    

    
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else { return }
        
        //muestra la lista de servicios disponibles
        for service in services {
            print(service)
        }
    }
}
