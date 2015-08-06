//
//  VDDMathParserOperators.swift
//  Math Parser
//
//  Created by Vid Drobnic on 8/4/15.
//  Copyright (c) 2015 Vid Drobnic. All rights reserved.
//

import Foundation


//MARK: Enum declaration
enum MathParserOperationType {
    case Prefix, Infix, Suffix
}

enum MathParserAngleUnit {
    case Radians, Degrees
}


//MARK: Protocol Declaration
protocol MathParserOperator {
    var type: MathParserOperationType {get}
    var priority: Int {get set}
    var startIndex: Int {get set}
    var length: Int {get}
    
    func evaluate(numbers: [Double]) -> Double
}


//MARK: Type Declarations

struct Addition: MathParserOperator {
    var type = MathParserOperationType.Infix
    var priority = 1
    var startIndex = -1
    var length = 2
    
    func evaluate(numbers: [Double]) -> Double {
        return numbers[0] + numbers[1]
    }
}

struct Substraction: MathParserOperator {
    var type = MathParserOperationType.Infix
    var priority = 1
    var startIndex = -1
    var length = 2
    
    func evaluate(numbers: [Double]) -> Double {
        return numbers[0] - numbers[1]
    }
}

struct Multiplication: MathParserOperator {
    var type = MathParserOperationType.Infix
    var priority = 2
    var startIndex = -1
    var length = 2
    
    func evaluate(numbers: [Double]) -> Double {
        return numbers[0] * numbers[1]
    }
}

struct Division: MathParserOperator {
    var type = MathParserOperationType.Infix
    var priority = 2
    var startIndex = -1
    var length = 2
    
    func evaluate(numbers: [Double]) -> Double {
        return numbers[0] / numbers[1]
    }
}

struct Power: MathParserOperator {
    var type = MathParserOperationType.Infix
    var priority = 3
    var startIndex = -1
    var length = 2
    
    func evaluate(numbers: [Double]) -> Double {
        return pow(numbers[0], numbers[1])
    }
}

struct Root: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 3
    var startIndex = -1
    var length = 2
    
    func evaluate(numbers: [Double]) -> Double {
        return pow(numbers[1], 1.0 / numbers[0])
    }
}

struct Logarithm: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 3
    var startIndex = -1
    var length = 2
    
    func evaluate(numbers: [Double]) -> Double {
        return log10(numbers[1]) / log10(numbers[0])
    }
}

struct Factorial: MathParserOperator {
    var type = MathParserOperationType.Suffix
    var priority = 4
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        if number > 170 || number < 1 || number != Double(Int(number)) {
            return Double.NaN
        }
        
        var result: Double = 1
        for i in 1...Int(number) {
            result *= Double(i)
        }
        
        return result
    }
}

struct Sin: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return sin(number)
        case .Degrees:
            return sin(degreeToRadian(number))
        }
    }
}

struct Cos: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return cos(number)
        case .Degrees:
            return cos(degreeToRadian(number))
        }
    }
}

struct Tan: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return tan(number)
        case .Degrees:
            return tan(degreeToRadian(number))
        }
    }
}

struct Sinh: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return sinh(number)
        case .Degrees:
            return sinh(degreeToRadian(number))
        }
    }
}

struct Cosh: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return cosh(number)
        case .Degrees:
            return cosh(degreeToRadian(number))
        }
    }
}

struct Tanh: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return tanh(number)
        case .Degrees:
            return tanh(degreeToRadian(number))
        }
    }
}

struct Asin: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return asin(number)
        case .Degrees:
            return asin(degreeToRadian(number))
        }
    }
}

struct Acos: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return acos(number)
        case .Degrees:
            return acos(degreeToRadian(number))
        }
    }
}

struct Atan: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return atan(number)
        case .Degrees:
            return atan(degreeToRadian(number))
        }
    }
}

struct Asinh: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return asinh(number)
        case .Degrees:
            return asinh(degreeToRadian(number))
        }
    }
}

struct Acosh: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return acosh(number)
        case .Degrees:
            return acosh(degreeToRadian(number))
        }
    }
}

struct Atanh: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 5
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        let number = numbers[0]
        
        switch mathParserAngleUnits {
        case .Radians:
            return atanh(number)
        case .Degrees:
            return atanh(degreeToRadian(number))
        }
    }
}

struct Negation: MathParserOperator {
    var type = MathParserOperationType.Prefix
    var priority = 6
    var startIndex = -1
    var length = 1
    
    func evaluate(numbers: [Double]) -> Double {
        return -numbers[0]
    }
}


//MARK: Constants
let mathParserBracketPriority = 10
var mathParserAngleUnits = MathParserAngleUnit.Degrees
let mathParserOperators: [String: MathParserOperator] = ["+": Addition(), "-": Substraction(), "*": Multiplication(), "÷": Division(), //×
                                                     "^": Power(), "√": Root(), "log": Logarithm(), "!": Factorial(), "sin": Sin(),
                                                     "cos": Cos(), "tan": Tan(), "asin": Asin(), "Acos": Acos(), "atan": Atan(),
                                                     "sinh": Sinh(), "cosh": Cosh(), "tanh": Tanh(), "asinh": Asinh(), "acosh": Acosh(), "atanh": Atanh()]