//
//  Stack.swift
//  SwiftAlgorithms
//
//  Created by Kyle Rokita on 10/25/16.
//
//

class Stack<T> {
    private var storage = LinkedList<T>()
    private(set) public var size: Int = 0
    
    public func push(_ item: T) {
        storage.insertLast(item)
        size += 1
    }
    
    public func pop() -> T? {
        guard !isEmpty() else {
            return nil
        }
        
        let element = storage.removeLast()
        size -= 1
        return element
    }
    
    public func peek() -> T? {
        guard !isEmpty() else {
            return nil
        }
        
        let element = storage.last?.value
        return element
    }
    
    public func isEmpty() -> Bool {
        return size == 0
    }
}


