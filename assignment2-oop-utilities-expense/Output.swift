//
//  Output.swift
//  assignment2-oop-utilities-expense
//
//  Created by Parinya Termkasipanich on 4/9/2565 BE.
//

import Cocoa

class Output: NSObject {
    func Show (data: (subtotal:Float, vat:Float, total:Float, type:Int, unit:Int)) {
        print("""
        
        [----Water Tariffs Calculator NonFixRate----]
        [-Usage Detail-]
        Type : \(data.type)
        Volume : \(data.unit) cu.m.
        [-Payment Detail-]
        Subtotal (Vat not included) : \(data.subtotal) Baht
        Vat 7% : \(data.vat) Baht
        Total (Vat included) : \(data.total) Baht
        
        """)
    }
    
    func Show (data: (subtotal:Float, vat:Float, total:Float, type:Int, unit:Int, rate:Float)) {
        print("""
        
        [----Water Tariffs Calculator FixRate----]
        [-Usage Detail-]
        Type : \(data.type)
        Volume : \(data.unit) cu.m.
        Rate : \(data.rate) Baht/cu.m.
        [-Payment Detail-]
        Subtotal (Vat not included) : \(data.subtotal) Baht
        Vat 7% : \(data.vat) Baht
        Total (Vat included) : \(data.total) Baht
        
        """)
    }
    
    func Show (data: (subtotal:Float, vat:Float, total:Float, package_name:String, package_price:Float, inpackage_call:Int, extra_call:Int, extra_call_price:Float, sms_use:Int, sms_price:Float)) {
        print("""
        
        [----Mobile Package Calculator----]
        [-Package Detail-]
        Package : \(data.package_name)
        Price : \(data.package_price) Baht/Month
        [Usage Detail]
        Package Call : \(data.inpackage_call) Minutes | 0 Baht
        Extra Call (1.5 Baht/Minutes) : \(data.extra_call) minutes | \(data.extra_call_price) Baht
        SMS : \(data.sms_use) Message | \(data.sms_price) Baht
        [-Payment Detail-]
        Subtotal (Vat not included) : \(data.subtotal) Baht
        Vat 7% : \(data.vat) Baht
        Total (Vat included) : \(data.total) Baht
        
        """)
    }
    
    func Error () {
        print("Error Occur, Please Try Again!")
    }
}
