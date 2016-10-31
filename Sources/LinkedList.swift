//
//  LinkedList.swift
//  Algorithms
//
//  Created by Kyle Rokita on 10/25/16.
//
//

public class LinkedList<T: Equatable> {
    public typealias Node = LinkedListNode<T>
    
    private(set) public var first: Node?
    private(set) public var last: Node?

    public var isEmpty: Bool {
        return first == nil
    }
    
    private func insert(node: Node, afterNode: Node) {
        node.next = afterNode.next
        node.previous = afterNode
        
        afterNode.next = node
    }
    
    private func insert(node: Node, beforeNode: Node) {
        node.previous = beforeNode.previous
        node.next = beforeNode

        beforeNode.previous = node
    }
    
    private func remove(node: Node) {
        guard let first = first,
              let last = last else {
            return
        }
        
        if (node === first) {
            self.first = node.next
        }
        
        if (node === last) {
            self.last = node.previous
        }
        
        let nextNode = node.next
        node.previous?.next = nextNode
        nextNode?.previous = node.previous
    }
    
    public func insertFirst(_ value: T) {
        let node = Node(value: value)
        
        if let oldFirst = first {
            insert(node: node, beforeNode: oldFirst)
            first = node
        } else {
            first = node
            last = node
        }
    }
    
    public func insertLast(_ value: T) {
        let node = Node(value: value)

        if let oldTail = last {
            insert(node: node, afterNode: oldTail)
            last = node
        } else {
            first = node
            last = node
        }
    }
    
    public func removeFirst() -> T? {
        guard let first = first else {
            return nil
        }
        
        let element = first.value
        remove(node: first)
        return element
    }
    
    public func removeLast() -> T? {
        guard let last = last else {
            return nil
        }
        
        let element = last.value
        remove(node: last)
        return element
    }
    
    func indexOf(_ value: T) -> Int? {
        var index = 0
        
        var node = first
        while node != nil {
            if (node!.value == value) {
                return index
            }
            
            node = node!.next
            index += 1
        }
        return nil
    }
    
    public func contains(_ value: T) -> Bool {
        var node = first
        
        while node != nil {
            if (node!.value == value) {
                return true
            }
            
            node = node!.next
        }
        return false
    }
    
    public func forEach(_ callback: (T) -> Void) {
        var node = first
        
        while node != nil {
            callback(node!.value)
            node = node!.next
        }
    }
    
}


public class LinkedListNode<T> {
    public var value: T
    public var next: LinkedListNode?
    public var previous: LinkedListNode?
    
    public init(value: T) {
        self.value = value
    }
}


