//
//  Stack.swift
//  Calculator
//
//  Created by 덕복 on 2021/03/25.
//

struct Stack<Type> {
    private var items = [Type]()
    
    /// The number of elements in the stack.
    var count: Int {
        return items.count
    }
    
    /// A Boolean value indicating whether the collection is empty.
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    /// A Boolean value indicating whether the collection is not empty.
    var isNotEmpty: Bool {
        return false == items.isEmpty
    }
    
    /// Checks the last element of the stack.
    func peek() -> Type? {
        return items.last
    }
    
    /// Adds a new element at the end of the stack.
    mutating func push(_ item: Type) {
        items.append(item)
    }
    
    /// Removes and returns the last element of the stack.
    mutating func pop() -> Type? {
        return items.popLast()
    }
    
    /// Removes all elements from the stack.
    mutating func clear() {
        return items.removeAll()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return items.description
    }
}
