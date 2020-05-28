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
    //CBCentralManager objeto que usaremos para scanear, conectar perifericos.
    //smartGlovesPeripheral, Es el periferica con el que vamos a interactuar.
    //smartGlovesCharacteristic, En este guardaremos la caracteristica que permite mandar y recivir datos del periferico.
    var centralManager : CBCentralManager!
    var smartGlovesPeripheral : CBPeripheral!
    var smartGlovesCharacteristic : CBCharacteristic!
    
    //Peripheral : AT-09 BLE module is peripheral. We will use characteristics “FFE1” to write data “ON” and “OFF”.
    //Guarda el uuid del modulo bluetooth AT-09, el cual indica que se puede leer y escribir datos sobre el modulo.
    let characteristicCode = "FFE1"
    
    //Nombre del modulo bluetooth
    let smartGlovesBluetoothName = "smartGloves" //MLT-BT05

    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    
    //Si requiere enviar datos al periferico
    func sendButtonPressed() {
        let helloWorld = "Hello World!"
        let dataToSend = helloWorld.data(using: String.Encoding.utf8)
        
        if (smartGlovesPeripheral != nil) {
            smartGlovesPeripheral?.writeValue(dataToSend!, for: smartGlovesCharacteristic!, type: CBCharacteristicWriteType.withoutResponse)
        } else {
            print("haven't discovered device yet")
        }
    }
    

}

//CBPeripheralDelegate metodo delegado para descubrir los servicios de un periferico.
extension testBluetoothViewController : CBCentralManagerDelegate, CBPeripheralDelegate {
    
    //Funcion necesaria dentro de CBCentralDelegate
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        //Switch que muestra todos los posibles estados del bluetooth en el dispositivo.
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
        
        //Cuando encuantre el bluetooth del guante inteligente, guardara el periferico y dejara de escanear.
        if peripheral.name == smartGlovesBluetoothName {
            smartGlovesPeripheral = peripheral
            smartGlovesPeripheral.delegate = self
            centralManager.stopScan()
            
            //conecta con el periferico que encontro.
            centralManager.connect(smartGlovesPeripheral)
        }
    }
    
    //Funcion para verificar que se conecto correctamente
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("Conecatado!")
        //Para descubiri los servicios del periferico. Si se requiere un servicio en especifico se coloca el uuid.
        //smartGlovesPeripheral.discoverServices(["uuid"])
        //Imprimira esto ---->  <CBService: 0x1c046f280, isPrimary = YES, UUID = Heart Rate>
        smartGlovesPeripheral.discoverServices(nil)
    }
    

    
    //Funcion que servira para describir los servicios del dispositivo conectado.
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        //Guarda los servicios del periferico.
        guard let services = peripheral.services else { return }
        
        //Muestra la lista de servicios disponibles
        for service in services {
            print("Service:  ",service)
            print("Service found with UUID: " + service.uuid.uuidString)
            //Se manda el servicio para encontrar las caracteristicas del periferico.
            peripheral.discoverCharacteristics(nil, for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
        for characteristic in service.characteristics! {
            
            print("Characteristic : ", characteristic)
            print("Characteristic found with UUID: " + characteristic.uuid.uuidString)
            
            if characteristic.uuid.uuidString == characteristicCode {
                //Se guarda la caracteristica para despues mandar o recivir los datos del periferico.
                smartGlovesCharacteristic = characteristic
                
                // MARK: - para recibir valores puede ser de otra forma
                //in our example we have to write on and off, readValue does not make any sense for now. Uncomment when needed
                //peripheral.readValue(for: characteristic) //to read the value of the characteristic
                
                //Set Notify is useful to read incoming data async
                peripheral.setNotifyValue(true, for: characteristic)
                print("Found smartGloves Data Characteristic")
            }
            
        }
    }
    
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        
        //Se comprueba que este activo el estado para recivir datos, ya que el guante manda datos cada 250 ms
        //y hay momentos especificos que necesitamos ciertos datos, en ese caso se activa para obtener los datos que despues seran mandados a la API.
        /*ej: Al calibrar el alfabeto, cuando el usuario presione el boton de "empezar", tendra n segundos para adoptar la posicion con el guante, despues de esos n segundos
                se activara y en 3 segundos se vuelve a desactivar, estos datos que se capturaron en los 3 segundos son los que nos interesan.*/
        if stateToRecvData == .active {
            if characteristic.uuid.uuidString == characteristicCode {
                //data recieved
                if(characteristic.value != nil) {
                    let stringValue = String(data: characteristic.value!, encoding: String.Encoding.utf8)!
                
                    print("data send by Bluetooth: ", stringValue)
                }
            }
        }
 
    }

    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print(error!)
    }
}


//{'ax': ax,
//    'ay': ay,
//    'az': az,
//    'gx': gx,
//    'gy': gy,
//    'gz': gz,
//    'd1': d1,
//    'd2': d2,
//    'd3': d3,
//    'd4': d4
//}

//{'ax':1300,
// 'ay':200,
// 'az':1723,
// 'gx':637,
// 'gy':319,
// 'gz':35,
// 'd1':20,
// 'd2':30,
// 'd3':40,
// 'd4':50
//}
