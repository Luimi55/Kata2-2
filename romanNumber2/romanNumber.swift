//
//  romanNumber.swift
//  romanNumber2
//
//  Created by Luis Miguel Rosa Reyes on 5/6/21.
//

import Foundation

public class romanNumber{
    func numeralEven(roman: String)->Int{
        let dict: [String: Int] = ["I": 1, "IV": 4, "V": 5, "IX": 9, "X": 10,"XL": 40,
                                     "L": 50, "XC": 90, "C": 100, "CD": 400, "D": 500,
                                     "CM": 900, "M": 1000]
        var i:Int = 0
        var acu:Int = 0
        let romanString = Array(roman)
        
        while i < roman.count-1{
            
            let romanNum = add(ch: romanString, index: i)
            let numeralNumber = get(dict: dict, key: romanNum)
            if(numeralNumber != -1){
                acu += numeralNumber
            } else{
                let romanNumberDiv = Array(romanNum)
                var str1 = ""
                str1.append(romanNumberDiv[0])
                let numeralNumber1 = get(dict: dict, key: str1)
                
                var str2 = ""
                str2.append(romanNumberDiv[1])
                let numeralNumber2 = get(dict: dict, key: str2)
                
                acu += numeralNumber1 + numeralNumber2
                
            }
            i+=2
        }
        return acu
    }
    
    func numeralOdd(roman: String)->Int{
        let dict: [String: Int] = ["I": 1, "IV": 4, "V": 5, "IX": 9, "X": 10,"XL": 40,
                                     "L": 50, "XC": 90, "C": 100, "CD": 400, "D": 500,
                                     "CM": 900, "M": 1000]
        var i:Int = 1
        var acu:Int = 0
        let romanString = Array(roman)
        
        var str = ""
        str.append(romanString[0])
        acu += get(dict: dict, key: str)
        
        while i < roman.count-1{
            let romanNum = add(ch: romanString, index: i)
            let numeralNumber = get(dict: dict, key: romanNum)
            if(numeralNumber != -1){
                acu += numeralNumber
            } else{
                let romanNumberDiv = Array(romanNum)
                var str1 = ""
                str1.append(romanNumberDiv[0])
                let numeralNumber1 = get(dict: dict, key: str1)
                
                var str2 = ""
                str2.append(romanNumberDiv[1])
                let numeralNumber2 = get(dict: dict, key: str2)
                
                acu += numeralNumber1 + numeralNumber2
                
            }
            i+=2
        }
        return acu
    }
    
    func numeraToRoman(numeral: Int)->String{
        let dict:[(key: String, value: Int)] = [(key: "M", value: 1000), (key: "CM", value: 900), (key: "D", value: 500),(key: "CD", value: 400), (key: "C", value: 100), (key: "XC", value: 90), (key: "L", value: 50), (key: "XL", value: 40), (key: "X", value: 10),(key: "IX", value: 9),(key: "V", value: 5),(key: "IV", value: 4), (key: "I", value: 1)]
        
        var i:Int = 0
        var j:Int = 0
        var str = ""
        var temp = numeral
        
        while i < dict.count {
            if(temp >= dict[i].value){
                let cant:Int = temp / dict[i].value
                while j < cant {
                    str += dict[i].key
                    j+=1
                }
                j=0
                if(temp %  dict[i].value != 0){
                    temp = temp - (dict[i].value * cant)
                } else{
                    break
                }
            }
            i += 1
        }
        
        return str
    }
    
    func add(ch: Array<Character>, index: Int) -> String{
        var str:String = ""
        var i:Int = index
        while i < index + 2{
            str.append(ch[i])
            i+=1
        }
        return str
    }
    
    func get(dict: [String: Int], key: String) -> Int{
        for (keys, value) in dict {
            if key == keys {
                return value
            }
        }
        return -1
    }
    
}

