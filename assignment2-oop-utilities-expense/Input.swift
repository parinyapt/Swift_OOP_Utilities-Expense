//
//  Input.swift
//  assignment2-oop-utilities-expense
//
//  Created by Parinya Termkasipanich on 4/9/2565 BE.
//

import Cocoa

class Input: NSObject {
    func Select(title:String,list:[String:String]) -> String{
        var temp_text:String = ""
        var keyExists:Bool = false
        
        var select_list:String = "Please select \(title) in list [\(title) >> Description]\n"
        for (key,value) in list.sorted(by: { $0.key < $1.key }) {
            select_list += "\(key) >> \(value)\n"
        }
        
        repeat {
            print(select_list)
            print("Enter \(title) : ", terminator: "")
            temp_text = readLine()!
            keyExists = list[temp_text] != nil
        } while (!keyExists)
        
        return temp_text
    }
    
    func Number(title:String,min:Int? = nil,max:Int? = nil) -> Int {
        var temp_status:Bool = false
        var temp_text:String = ""
        
        repeat {
              print("\(title) : ",terminator: "")
              temp_text = readLine()!
              if Int(temp_text) != nil {
                  //check min max
                  if ((min != nil && Int(temp_text)! >= min!) || min == nil) && ((max != nil && Int(temp_text)! <= max!) || max == nil) {
                      temp_status = true
                  }
              }
        } while (temp_status == false)
        return Int(temp_text)!
    }
    
    func Decimal(title:String,min:Float? = nil,max:Float? = nil) -> Float {
        var temp_status:Bool = false
        var temp_text:String = ""
        
        repeat {
              print("\(title) : ",terminator: "")
              temp_text = readLine()!
              if Double(temp_text) != nil {
                  //check min max
                  if ((min != nil && Float(temp_text)! >= min!) || min == nil) && ((max != nil && Float(temp_text)! <= max!) || max == nil) {
                      temp_status = true
                  }
              }
        } while (temp_status == false)
        return Float(temp_text)!
    }
    
}
