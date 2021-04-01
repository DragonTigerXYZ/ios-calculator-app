//
//  Calculator.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/27.
//

class Calculator<OperandType: Operand, InfixOperatorType: InfixOperator, PrefixOperatorType: PrefixOpreator> {
    private var postfixedList = Array<CalculatingElement>()
    private var operandStack = Stack<OperandType>()
    private var infixOperatorStack = Stack<InfixOperatorType>()
    private(set) var lastOperand: OperandType?
    private(set) var lastOperator: InfixOperatorType?
    private(set) var calculated: OperandType? {
        didSet {
            guard let toPrint = calculated else { return }
            print("calculated: \(toPrint), postfixedList: \(postfixedList), operandStack: \(operandStack), operatorStack: \(infixOperatorStack)")
        }
    }
    
    fileprivate init() { }
    
    /// prefixOperator로 Operand를 계산하여 결과값을 반환한다.
    func calculate(by prefixOperator: PrefixOperatorType, x: OperandType) -> OperandType {
        return OperandType.zero
    }
    
    /// infixOperator로 두 Operand를 계산하여 결과값을 반환한다.
    fileprivate func calculate(lhs: OperandType, by infixOperator: InfixOperatorType, rhs: OperandType) -> OperandType {
        return OperandType.zero
    }
    
    /// infixOperatorStack에서 pop하여 계산식에 추가하고, 중간계산을 한다.
    private func inputPoppedInfixOperator() {
        guard let poppedInfixOperator = infixOperatorStack.pop() else { return }
        
        postfixedList.append(poppedInfixOperator)
        operate()
    }
    
    /// operand를 계산식에  추가하고, lastOperand에 저장한다.
    func input(_ operand: OperandType) {
        postfixedList.append(operand)
        lastOperand = operand
    }
    
    /// operator를 우선순위에 따라 계산식에 추가하고, lastOperand에 저장한다.
    func input(_ infixOperator: InfixOperatorType) {
        while infixOperatorStack.isNotEmpty {
            if infixOperator.isPrecedence(over: infixOperatorStack.peek()!) { break }
            inputPoppedInfixOperator()
        }
        infixOperatorStack.push(infixOperator)
        lastOperator = infixOperator
    }
    
    /// " "로 구분된 operand와 operator를 계산식에 추가한다.
    ///
    /// 아래와 같은 방식으로 사용한다.
    ///
    ///     let equation: String = "3 + 4 - 5"
    ///     input(contentsOf: equation)
    ///
    func input(contentsOf elements: String) {
        for element in elements.components(separatedBy: " ") {
            if let infixOperator = InfixOperatorType(rawValue: element) {
                input(infixOperator)
            }
            if let operand = OperandType(element) {
                input(operand)
            }
        }
    }
    
    /// 현재 계산식을 진행한 결과로 calculated를 업데이트 해준다.
    private func operate() {
        while false == postfixedList.isEmpty {
            let element = postfixedList.removeFirst()
            if element is OperandType {
                operandStack.push(element as! OperandType)
            }
            if element is InfixOperatorType {
                let infixOperator = element as! InfixOperatorType
                guard let rightOperand = operandStack.pop() else { return }
                guard let leftOperand = operandStack.pop() else { return }
                
                calculated = calculate(lhs: leftOperand, by: infixOperator, rhs: rightOperand)
                operandStack.push(calculated!)
            }
        }
    }
    
    /// 계산식을 완성하여 진행한다.
    func equal() {
        while infixOperatorStack.isNotEmpty {
            guard let infixOperator = infixOperatorStack.pop() else { return }
            postfixedList.append(infixOperator)
        }
        operate()
    }
    
    /// 계산기를 초기화한다.
    func clear() {
        postfixedList.removeAll()
        infixOperatorStack.clear()
        operandStack.clear()
        lastOperand = nil
        lastOperator = nil
        calculated = nil
    }
}

class DecimalCalculator: Calculator<DecimalNumber, DecimalInfixOperator, DecimalPrefixOperator> {
    static let shared = DecimalCalculator()
    
    override func calculate(by prefixOperator: DecimalPrefixOperator, x: DecimalNumber) -> DecimalNumber {
        let value = x.value
        
        switch prefixOperator {
        case .unaryMinus:
            return DecimalNumber(-value)
        }
    }
    
    override func calculate(lhs: DecimalNumber, by infixOperator: DecimalInfixOperator, rhs: DecimalNumber) -> DecimalNumber {
        let leftValue = lhs.value
        let rightValue = rhs.value
        
        switch infixOperator {
        case .multifly:
            return DecimalNumber(leftValue * rightValue)
        case .divide:
            return DecimalNumber(leftValue / rightValue)
        case .add:
            return DecimalNumber(leftValue + rightValue)
        case .subtract:
            return DecimalNumber(leftValue - rightValue)
        }
    }
}

class BinaryCalculator: Calculator<BinaryNumber, BinaryInfixOpeartor, BinaryPrefixOperator> {
    static let shared = BinaryCalculator()
    
    override func calculate(by prefixOperator: BinaryPrefixOperator, x: BinaryNumber) -> BinaryNumber {
        let value = x.value
        
        switch prefixOperator {
        case .bitwiseNOT:
            return BinaryNumber(~value)
        case .unaryMinus:
            return BinaryNumber(-value)
        }
    }
    
    override func calculate(lhs: BinaryNumber, by infixOperator: BinaryInfixOpeartor, rhs: BinaryNumber) -> BinaryNumber {
        let leftValue = lhs.value
        let rightValue = rhs.value
        
        switch infixOperator {
        case .bitwiseLeftShift:
            return BinaryNumber(leftValue << rightValue)
        case .bitwiseRightShift:
            return BinaryNumber(leftValue >> rightValue)
        case .bitwiseAND:
            return BinaryNumber(leftValue & rightValue)
        case .bitwiseNAND:
            return BinaryNumber(~leftValue | ~rightValue)
        case .add:
            return BinaryNumber(leftValue + rightValue)
        case .subtract:
            return BinaryNumber(leftValue - rightValue)
        case .bitwiseOR:
            return BinaryNumber(leftValue | rightValue)
        case .bitwiseNOR:
            return BinaryNumber(~leftValue & ~rightValue)
        case .bitwiseXOR:
            return BinaryNumber(leftValue ^ rightValue)
        }
    }
}
