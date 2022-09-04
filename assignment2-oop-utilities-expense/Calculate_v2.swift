//
//  Calculate_v2.swift
//  assignment2-oop-utilities-expense
//
//  Created by Parinya Termkasipanich on 4/9/2565 BE.
//

import Cocoa

class Calculate_v2: Calculate {
    override func Water_Tariffs (type:Int, unit:Int) -> (subtotal:Float, vat:Float, total:Float, type:Int, unit:Int)? {
        var rate:Float = 0.0
        
        if(type == 1){
            if(unit > 200){
                rate = 14.45
            }else if(unit >= 161){
                rate = 13.80
            }else if(unit >= 121){
                rate = 13.47
            }else if(unit >= 101){
                rate = 13.15
            }else if(unit >= 91){
                rate = 12.82
            }else if(unit >= 81){
                rate = 12.50
            }else if(unit >= 71){
                rate = 11.33
            }else if(unit >= 61){
                rate = 11.00
            }else if(unit >= 51){
                rate = 10.68
            }else if(unit >= 41){
                rate = 10.35
            }else if(unit >= 31){
                rate = 10.03
            }else{
                rate = 8.50
            }
        }else{
            if(unit > 200){
                rate = 15.81
            }else if(unit >= 161){
                rate = 15.49
            }else if(unit >= 121){
                rate = 15.16
            }else if(unit >= 101){
                rate = 14.84
            }else if(unit >= 81){
                rate = 14.51
            }else if(unit >= 61){
                rate = 14.19
            }else if(unit >= 51){
                rate = 13.86
            }else if(unit >= 41){
                rate = 13.54
            }else if(unit >= 31){
                rate = 13.21
            }else if(unit >= 21){
                rate = 10.95
            }else if(unit >= 11){
                rate = 10.70
            }else{
                rate = 9.50
            }
        }
        //Calculate
        subtotal = Float(unit) * rate
        subtotal = type == 2 && subtotal < 90 ? 90 : subtotal
        vat = subtotal * 0.07
        total = subtotal + vat
        
        return (subtotal, vat, total, type, unit)
    }
}
