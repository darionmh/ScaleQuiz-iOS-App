//
//  ScaleSet.swift
//  Scale Quiz
//
//  Created by Bobby Bearcat on 11/4/15.
//  Copyright © 2015 Darion Higgins. All rights reserved.
//

import Foundation

class ScaleSet{
    var MajorScales:[Scale]
    var MinorScales:[Scale]
    var AllScales:[Scale]
    
    var MajorSharp = ["C", "G", "D", "A", "E", "B", "F#"]
    var MajorFlat = ["C", "F", "Bb", "Eb", "Ab", "Db"]
    
    var MinorSharp = ["A", "E", "B", "F#", "C#", "G#"]
    var MinorFlat = ["A", "D", "G", "C", "F", "Bb", "Eb"]
    
    //Overall initializer
    init(numOfMajor:Int, numOfMinor:Int, naturalMinors:Bool, harmonicMinors:Bool, melodicMinors:Bool, numOfSharps:Int, numOfFlats:Int){
        MajorScales = []
        MinorScales = []
        AllScales = []
        initMajorScales(numOfSharps, numOfFlats: numOfFlats)
        initMinorScales(numOfSharps, numOfFlats: numOfFlats)
        
        //Gets all of the Major scales it needs, all random (only repeats if it has them all)
        var tempArray:[Scale] = []
        srand48(Int(time(nil)))
        while(tempArray.count < numOfMajor){
            if(MajorScales.isEmpty){
                initMajorScales(numOfSharps, numOfFlats: numOfFlats)
            }
            let i = Int(drand48() * Double(MajorScales.count))
            let s = MajorScales.removeAtIndex(i)
            tempArray.append(s)
        }
        AllScales.appendContentsOf(tempArray)
        tempArray.removeAll()
        
        //Gets all the Minor scales it needs, all random (only repeats if it has them all)
        srand48(Int(time(nil)))
        while(tempArray.count < numOfMinor){
            if(MinorScales.isEmpty){
                initMinorScales(numOfSharps, numOfFlats: numOfFlats)
            }
            let i = Int(drand48() * Double(MinorScales.count))
            let s = MinorScales.removeAtIndex(i)
            tempArray.append(s)
        }
        setupMinors(naturalMinors, harmonicMinors: harmonicMinors, melodicMinors: melodicMinors, minorScales: &tempArray)
        AllScales.appendContentsOf(tempArray)
        tempArray.removeAll()
        
        tempArray.appendContentsOf(AllScales)
        AllScales.removeAll()
        srand48(Int(time(nil)))
        while(tempArray.isEmpty == false){
            
            let i = Int(drand48() * Double(tempArray.count))
            
            AllScales.append(tempArray[i])
            tempArray.removeAtIndex(i)
        }
    }
    
    func initMajorScales(numOfSharps:Int, numOfFlats:Int){
        for var i=0; i<=numOfSharps; i++
        {
           MajorScales.append(Scale(sharps: i, name: MajorSharp[i], isMajor: true))
        }
        for var i=1;i<numOfFlats; i++
        {
            MajorScales.append(Scale(flats: i, name: MajorFlat[i], isMajor: true))
        }
    }
    
    func initMinorScales(numOfSharps:Int, numOfFlats:Int){
        for var i=1; i<numOfSharps; i++
        {
            MinorScales.append(Scale(sharps: i, name: MinorSharp[i], isMajor: false))
        }
        for var i=0;i<=numOfFlats; i++
        {
            MinorScales.append(Scale(flats: i, name: MinorFlat[i], isMajor: false))
        }
    }
    
    func setupMinors(naturalMinors:Bool, harmonicMinors:Bool, melodicMinors:Bool, inout minorScales:[Scale]){
        //1 for Natural, 2 for Harmonic, 3 for Melodic
        var choices:[Int] = []
        if(naturalMinors){
            choices.append(1)
        }
        if(harmonicMinors){
            choices.append(2)
        }
        if(melodicMinors){
            choices.append(3)
        }
        
        if(choices.count == 0){
            choices.append(1)
        }
        
        srand48(Int(time(nil)))
        for(var i=0;i<minorScales.count;i++){
            
            let type = choices[Int(drand48() * Double(choices.count))]
            if(type == 1){
                minorScales[i].isNatural = true
            }
            if(type == 2){
                minorScales[i].isHarmonic = true
            }
            if(type == 3){
                minorScales[i].isMelodic = true
            }
        }
    }
}