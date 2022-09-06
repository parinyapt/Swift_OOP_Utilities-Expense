//
//  main.swift
//  assignment2-oop-utilities-expense
//
//  Created by Parinya Termkasipanich on 4/9/2565 BE.
// https://www.mea.or.th/upload/download/file_0cbe47e5f271ef298469220a52ae00d8.pdf

import Foundation

var use_status:Bool = true
var menu_select:String = ""

let input = Input()
let calculate = Calculate(initsubtotal:0,initvat:0,inittotal:0)
let calculatev2 = Calculate_v2(initsubtotal:0,initvat:0,inittotal:0)
let output = Output()

repeat {
    menu_select = input.Select(title: "Menu", list: [
        "1":"Electricity Tariffs Calculator",
        "2":"Water Tariffs Calculator (Non-FixRate)",
        "3":"Water Tariffs Calculator (FixRate)",
        "4":"Mobile Package Calculator",
        "exit":"Exit Program",
    ])
    
    if (menu_select == "1") {
        
        let unit_use = input.Number(title: "Enter used Energy (kWh)", min: 0)
        if let output_data = calculate.Electricity_Tariffs(unit: unit_use) {
            output.Show(data: output_data)
        }else{
            output.Error()
        }

        
    }
    else if (menu_select == "2"){
        
        let type_select = input.Select(title: "Type", list: [
            "1":"Residence",
            "2":"Government and small businesses",
            "3":"State enterprise/industry/large business",
          ])
        let unit_use = input.Number(title: "Enter Volume (cu.m.)", min: 0)
        if let output_data = calculate.Water_Tariffs(type: Int(type_select)!, unit: unit_use) {
            output.Show(data: output_data)
        }else{
            output.Error()
        }
        
    }
    else if (menu_select == "3"){
        
        let type_select = input.Select(title: "Type", list: [
            "1":"Residence",
            "2":"Commerce, Government Agency, State Enterprise and Industry",
          ])
        let unit_use = input.Number(title: "Enter Volume (cu.m.)", min: 0)
        if let output_data = calculatev2.Water_Tariffs(type: Int(type_select)!, unit: unit_use) {
            output.Show(data: output_data)
        }else{
            output.Error()
        }
        
    }
    else if (menu_select == "4"){
        
        let package_select = input.Select(title: "Package", list: [
            "1":"dtac GO 399",
            "2":"dtac GO 499",
            "3":"dtac GO 599",
            "4":"dtac GO 699",
            "5":"dtac GO 899",
            "6":"dtac GO 1099 internet unlimited",
            "7":"dtac GO 1499 internet unlimited",
            "8":"dtac GO 1999 internet unlimited",
            "9":"dtac GO 2199 internet unlimited",
            "10":"No Package"
          ])
        let call_use = input.Number(title: "Enter Call Usage (Second)", min: 0)
        let sms_use = input.Number(title: "Enter SMS Usage (Message)", min: 0)
        if let output_data = calculate.Mobile_Package(package: Int(package_select)!, call_second: call_use, sms: sms_use) {
            output.Show(data: output_data)
        }else{
            output.Error()
        }
        
    }
    else if (menu_select == "exit"){
        use_status = false
    }
    else {
        print("Menu not found!")
    }

} while (use_status == true)
