//
//  main.swift
//  Math Parser
//
//  Created by Vid Drobnic on 8/4/15.
//  Copyright (c) 2015 Vid Drobnic. All rights reserved.
//

import Foundation

let start = NSDate.timeIntervalSinceReferenceDate()
let result = evaluateExpression("-0", MathParserAngleUnit.Radians)
let end = NSDate.timeIntervalSinceReferenceDate()

let difference = Double(end) - Double(start)

let resultString: String
if let unwrapedResult = result {
    if unwrapedResult == Double.infinity {
        resultString = "Math error"
    } else if unwrapedResult == -0.0 {
        resultString = "\(-unwrapedResult)"
    } else {
        resultString = "\(unwrapedResult)"
    }
} else {
    resultString = "Syntax error"
}

println("\(resultString)\nTime: \(difference * 1000)ms")