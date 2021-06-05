//
//  romanNumber2Tests.swift
//  romanNumber2Tests
//
//  Created by Luis Miguel Rosa Reyes on 5/6/21.
//

import XCTest
@testable import romanNumber2

class romanNumber2Tests: XCTestCase {

    func testNumralEven(){
        let roman = romanNumber()
        let result = roman.numeralEven(roman: "VIII")
        XCTAssertEqual(result, 8)
    }

    func testNumralOdd(){
        let roman = romanNumber()
        let result = roman.numeralOdd(roman: "VII")
        XCTAssertEqual(result, 7)
    }
    
    func testNumeralToRoman(){
        let roman = romanNumber()
        let result1 = roman.numeralEven(roman: "VIII")
        let result2 = roman.numeralOdd(roman: "VII")
        let result = roman.numeraToRoman(numeral: (result1 + result2))
        
        XCTAssertEqual(result, "XV")
    }
    
    
}
