//
//  Calculate.swift
//  assignment2-oop-utilities-expense
//
//  Created by Parinya Termkasipanich on 4/9/2565 BE.
//

import Cocoa

class Calculate: NSObject {
    var subtotal:Float = 0
    var vat:Float = 0
    var total:Float = 0
    
    func Water_Tariffs_NonFixRate (type:Int, unit:Int) -> (subtotal:Float, vat:Float, total:Float, type:Int, unit:Int)? {
        var unit0_10:Float = 0
        var unit11_20:Float = 0
        var unit21_30:Float = 0
        var unit31_50:Float = 0
        var unit51_80:Float = 0
        var unit81_100:Float = 0
        var unit101_300:Float = 0
        var unit301_1000:Float = 0
        var unit1001_2000:Float = 0
        var unit2001_3000:Float = 0
        var unit3000UP:Float = 0

        if type == 1 {
          unit0_10 = 10.20
          unit11_20 = 16.00
          unit21_30 = 19.00
          unit31_50 = 21.20
          unit51_80 = 21.60
          unit81_100 = 21.65
          unit101_300 = 21.70
          unit301_1000 = 21.75
          unit1001_2000 = 21.80
          unit2001_3000 = 21.85
          unit3000UP = 21.90
        }else if type == 2 {
          unit0_10 = 17.00
          unit11_20 = 20.00
          unit21_30 = 21.00
          unit31_50 = 22.00
          unit51_80 = 23.00
          unit81_100 = 24.00
          unit101_300 = 27.40
          unit301_1000 = 27.50
          unit1001_2000 = 27.60
          unit2001_3000 = 27.80
          unit3000UP = 28.00
        }else{
          unit0_10 = 18.25
          unit11_20 = 21.50
          unit21_30 = 25.50
          unit31_50 = 28.50
          unit51_80 = 31.00
          unit81_100 = 31.25
          unit101_300 = 31.50
          unit301_1000 = 31.75
          unit1001_2000 = 32.00
          unit2001_3000 = 32.25
          unit3000UP = 32.50
        }

        if unit > 0 && unit < 11 {
          subtotal = Float(unit) * unit0_10
        }
        else if unit > 10 && unit < 21 {
          subtotal = (Float(unit)-10) * unit11_20
          subtotal = subtotal + (unit0_10 * 10)
        }
        else if unit > 20 && unit < 31 {
          subtotal = (Float(unit)-20) * unit21_30
          subtotal = subtotal + (unit0_10 * 10) + (unit11_20 * 10)
        }
        else if unit > 30 && unit < 51 {
          subtotal = (Float(unit)-30) * unit31_50
          subtotal = subtotal + (unit0_10 * 10) + (unit11_20 * 10) + (unit21_30 * 10)
        }
        else if unit > 50 && unit < 81 {
          subtotal = (Float(unit)-50) * unit51_80
          subtotal = subtotal + (unit0_10 * 10) + (unit11_20 * 10) + (unit21_30 * 10) + (unit31_50 * 20)
        }
        else if unit > 80 && unit < 101 {
          subtotal = (Float(unit)-80) * unit81_100
          subtotal = subtotal + (unit0_10 * 10) + (unit11_20 * 10) + (unit21_30 * 10) + (unit31_50 * 20) + (unit51_80 * 30)
        }
        else if unit > 100 && unit < 301 {
          subtotal = (Float(unit)-100) * unit101_300
          subtotal = subtotal + (unit0_10 * 10) + (unit11_20 * 10) + (unit21_30 * 10) + (unit31_50 * 20) + (unit51_80 * 30) + (unit81_100 * 20)
        }
        else if unit > 300 && unit < 1001 {
          subtotal = (Float(unit)-300) * unit301_1000
          subtotal = subtotal + (unit0_10 * 10) + (unit11_20 * 10) + (unit21_30 * 10) + (unit31_50 * 20) + (unit51_80 * 30) + (unit81_100 * 20) + (unit101_300 * 200)
        }
        else if unit > 1000 && unit < 2001 {
          subtotal = (Float(unit)-1000) * unit1001_2000
          subtotal = subtotal + (unit0_10 * 10) + (unit11_20 * 10) + (unit21_30 * 10) + (unit31_50 * 20) + (unit51_80 * 30) + (unit81_100 * 20) + (unit101_300 * 200) + (unit301_1000 * 700)
        }
        else if unit > 2000 && unit < 3001 {
          subtotal = (Float(unit)-2000) * unit2001_3000
          subtotal = subtotal + (unit0_10 * 10) + (unit11_20 * 10) + (unit21_30 * 10) + (unit31_50 * 20) + (unit51_80 * 30) + (unit81_100 * 20) + (unit101_300 * 200) + (unit301_1000 * 700) + (unit1001_2000 * 1000)
        }
        else{
          subtotal = (Float(unit)-3000) * unit3000UP
          subtotal = subtotal + (unit0_10 * 10) + (unit11_20 * 10) + (unit21_30 * 10) + (unit31_50 * 20) + (unit51_80 * 30) + (unit81_100 * 20) + (unit101_300 * 200) + (unit301_1000 * 700) + (unit1001_2000 * 1000) + (unit2001_3000 * 1000)
        }

        //Calculate
        subtotal = type == 2 && subtotal < 150 ? 150 : subtotal
        subtotal = type == 3 && subtotal < 300 ? 300 : subtotal
        vat = subtotal * 0.07
        total = subtotal + vat
        
        return (subtotal, vat, total, type, unit)
    }
    
    func Water_Tariffs_FixRate (type:Int, unit:Int) -> (subtotal:Float, vat:Float, total:Float, type:Int, unit:Int, rate:Float)? {
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
        
        return (subtotal, vat, total, type, unit, rate)
    }
    
    
    func Mobile_Package (package:Int, call_second:Int, sms:Int) -> (subtotal:Float, vat:Float, total:Float, package_name:String, package_price:Float, inpackage_call:Int, extra_call:Int, extra_call_price:Float, sms_use:Int, sms_price:Float)? {
        let config_package_name:[Int:String] = [
            1:"dtac GO 399",
            2:"dtac GO 499",
            3:"dtac GO 599",
            4:"dtac GO 699",
            5:"dtac GO 899",
            6:"dtac GO 1099 internet unlimited",
            7:"dtac GO 1499 internet unlimited",
            8:"dtac GO 1999 internet unlimited",
            9:"dtac GO 2199 internet unlimited",
            10:"No Package"
        ]
        let config_package_price:[Int:Float] = [
            1:399.0,
            2:499.0,
            3:599.0,
            4:699.0,
            5:899.0,
            6:1099.0,
            7:1499.0,
            8:1999.0,
            9:2199.0,
            10:0.0
        ]
        let config_package_callLimit:[Int:Int] = [
            1:150,
            2:200,
            3:300,
            4:300,
            5:400,
            6:700,
            7:1200,
            8:2500,
            9:0,
            10:0
        ]
        let config_package_unlimited:[Int] = [9]

        var call:[String:Int] = ["second":call_second,"minute":0,"inpackage":0,"extra":0]

        var call_extra_price:Float = 0.0
        var sms_price:Float = 0.0
        
        //calculate call
        call["minute"] = (call["second"]! / 60) + (call["second"]! % 60 == 0 ? 0 : 1)
        if(call["minute"]! > config_package_callLimit[package]! && !config_package_unlimited.contains(package)){
            call["inpackage"] = config_package_callLimit[package]!
            call["extra"] = call["minute"]! - config_package_callLimit[package]!
        }else{
            call["inpackage"] = call["minute"]!
            call["extra"] = 0
        }
        
        //calculate price
        call_extra_price = Float(call["extra"]!) * 1.5
        sms_price = Float(sms) * 3
        
        //calculate payment detail
        subtotal = config_package_price[package]! + call_extra_price + sms_price
        vat = subtotal * 0.07
        total = subtotal + vat
        
        return (subtotal, vat, total, config_package_name[package]!, config_package_price[package]!, call["inpackage"]!, call["extra"]!, call_extra_price, sms, sms_price)
    }
}
