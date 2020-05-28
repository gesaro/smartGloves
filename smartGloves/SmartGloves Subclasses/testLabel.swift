//
//  testLabel.swift
//  smartGloves
//
//  Created by Gerardo on 22/05/20.
//  Copyright © 2020 Gerardo. All rights reserved.
//

import UIKit

class testLabel : UILabel {
    
    let counterVelocity : Float = 3.0
    
    enum CounterAnimationType {
        case Linear //f(x) = x
        case EaseIn //f(x) = x^3
        case EasyOut //f(x) = (1 - x)^3
    }

    enum CounterType {
        case Int
        case Float
    }
    
    
    var startNumber : Int = 0
    var endNumber : Int = 0
        
    var progress : TimeInterval!
    var duration : TimeInterval!
    var lastUpdate : TimeInterval!
    
    var timer : Timer?
    
    var counterType : CounterType!
    var counterAnimationType: CounterAnimationType!
    
//    var currentCounterValue : Float {
//        if progress >= duration {
//            return endNumber
//        }
//
//        let percentage = Float(progress / duration)
//        let update = updateCounter(counterValue: percentage)
//
//        return startNumber + (update * (endNumber - startNumber))
//    }
    
    var currentCounterValue : Int = 0
    
    
    func count(fromValue: Int, to toValue: Int, withDuration duration: TimeInterval, andAnimationType animationType: CounterAnimationType, andCounterType counterType: CounterType){
        self.startNumber = fromValue
        self.endNumber = toValue
        self.duration = duration
        self.counterType = counterType
        self.counterAnimationType = animationType
        self.progress = 0

        invalidateTimer()

        if duration == 0 {
            updateText(value: toValue)
            return
        }

//        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateValue), userInfo: nil, repeats: true)
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateValue), userInfo: nil, repeats: true)
    }
    
    @objc func updateValue(){
//        let now = Date.timeIntervalSinceReferenceDate
//        progress = progress + (now - lastUpdate)
//
//        print(progress!, lastUpdate!, now)
//        lastUpdate = now
//
//
//        if progress >= duration {
//            invalidateTimer()
//            progress = duration
//        }
//
//        //updateText in label
//
//        updateText(value: currentCounterValue)
        
        if currentCounterValue  != 0 {
            currentCounterValue -= 1
            
            updateText(value: currentCounterValue)
        }
        else {
            timer?.invalidate()
            return
        }
        
    }
    
    
    func updateText(value: Int){
        self.text = String(value)
    }
        
//    func updateText(value: Float){
//        switch counterType! {
//        case .Int:
//            self.text = "\(Int(value))"
//        case .Float:
//            self.text = String(format: "%.2f", value)
//        }
//    }
    
        
    func updateCounter(counterValue: Float) -> Float {
        switch counterAnimationType! {
        case .Linear:
            return counterValue
        case .EaseIn:
            return powf(counterValue, counterVelocity)
        case .EasyOut:
            return 1.0 - powf(1.0 - counterValue, counterVelocity)
        }
    }
    
    
    func invalidateTimer(){
        timer?.invalidate()
        timer = nil
    }
}
