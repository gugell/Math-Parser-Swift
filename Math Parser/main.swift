//
//  main.swift
//  Math Parser
//
//  Created by Vid Drobnic on 8/4/15.
//  Copyright (c) 2015 Vid Drobnic. All rights reserved.
//

import Foundation

let expression = "cos(-0)"//"3123234×91243+7^3+32!÷16-asinh(cos(√(2,π+e)))"

let start = NSDate.timeIntervalSinceReferenceDate()
let result = evaluateExpression(expression, MathParserAngleUnit.Degrees)
let end = NSDate.timeIntervalSinceReferenceDate()

let difference = Double(end) - Double(start)

var resultString: String
if let unwrapedResult = result {
    if unwrapedResult == Double.infinity {
        resultString = "Math error"
    } else if unwrapedResult == -0.0 {
        resultString = "\(-unwrapedResult)"
        resultString = mathParserFormatNumber(resultString)
    } else {
        resultString = "\(unwrapedResult)"
        resultString = mathParserFormatNumber(resultString)
    }
} else {
    resultString = "Syntax error"
}

println("\(mathParserFormatExpression(expression)) = \(resultString)\nTime: \(difference * 1000)ms")