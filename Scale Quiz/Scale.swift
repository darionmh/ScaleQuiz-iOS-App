//
//  Scale.swift
//  Scale Quiz
//
//  Created by Bobby Bearcat on 11/4/15.
//  Copyright © 2015 Darion Higgins. All rights reserved.
//

import Foundation

class Scale{
    let sharps:Int
    let flats:Int
    let name:String
    let isMajor:Bool
    var isNatural:Bool = false
    var isHarmonic:Bool = false
    var isMelodic:Bool = false
    
    init(name:String, isMajor:Bool){
        self.sharps = 0
        self.flats = 0
        self.name = name
        self.isMajor = isMajor
    }
    
    init(sharps:Int, name:String, isMajor:Bool){
        self.sharps = sharps
        self.flats = 0
        self.name = name
        self.isMajor = isMajor
    }
    
    init(flats:Int, name:String, isMajor:Bool){
        self.sharps = 0
        self.flats = flats
        self.name = name
        self.isMajor = isMajor
    }
    
    func toString() -> String{
        var type = "";
        
        if(isMajor){
            type = "Major"
        }else{
            type = "Minor"
        }
        
        if(type == "Major"){
            return "\(name.capitalizedString) \(type)"
        }else{
            var subType = ""
            if(isNatural){
                subType = ""
            }else if(isHarmonic){
                subType = "Harmonic"
            }else{
                subType = "Melodic"
            }
            return "\(name.capitalizedString) \(subType) \(type)"
        }
        
    }
}