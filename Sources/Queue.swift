//
//  Stack.swift
//  SwiftAlgorithms
//
//  Created by Kyle Rokita on 10/25/16.
//
//

class Queue<T> {
    private var storage = LinkedList<T>()
    private(set) public var size: Int = 0
    
    public func enqueue(_ item: T) {
        storage.insertLast(item)
        size += 1
    }
    
    public func dequeue() -> T? {
        guard !isEmpty() else {
            return nil
        }
        
        let element = storage.removeFirst()
        size -= 1
        return element
    }
    
    public func isEmpty() -> Bool {
        return size == 0
    }
}


