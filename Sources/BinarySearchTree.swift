//
//  BinarySearchTree.swift
//  SwiftAlgorithms
//
//  Created by Kyle Rokita on 10/25/16.
//
//

// final required for protocol TreeEnumberable children property
final public class BinarySearchTree<T: Comparable> {
    public var value: T
    public var left: BinarySearchTree?
    public var right: BinarySearchTree?

    public init(value: T) {
        self.value = value
    }
    
    public func insert(_ value: T) {
        if value < self.value {
            if let left = left {
                left.insert(value)
            } else {
                left = BinarySearchTree(value:value)
            }
        } else {
            if let right = right {
                right.insert(value)
            } else {
                right = BinarySearchTree(value:value)
            }
        }
    }
    
    public func binarySearch(_ value: T) -> Bool {
        if value == self.value {
            return true
        }
        else if value < self.value {
            if let left = left {
                return left.binarySearch(value)
            }
        }
        else {
            if let right = right {
                return right.binarySearch(value)
            }
        }
        
        return false
    }
}

extension BinarySearchTree: TreeEnumerable {
    public var children: [BinarySearchTree] {
        get {
            return [left, right].flatMap { $0 }
        }
    }
}
