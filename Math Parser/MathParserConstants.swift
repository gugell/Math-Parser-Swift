//
//  MathParserConstants.swift
//  Math Parser
//
//  Created by Vid Drobnic on 8/5/15.
//  Copyright (c) 2015 Vid Drobnic. All rights reserved.
//

import Foundation

protocol MathParserConstant {
    var value: Double {get}
}


struct PI: MathParserConstant {
    var value = 3.1415926535897932
}

struct E: MathParserConstant {
    var value = 2.7182818284590452
}

let mathParserConstants: [String: MathParserConstant] = ["π": PI(), "e": E()]
