//
//  Tree.swift
//  SwiftAlgorithms
//
//  Created by Kyle Rokita on 10/25/16.
//
//

public class Tree<T> {
    public var value: T
    public var children = [Tree]()
    
    public init(value: T) {
        self.value = value
    }
    
    public func add(child: Tree) {
        children.append(child)
    }
}

extension Tree where T: Equatable {
    public func contains(value: T) -> Bool {
        if self.value == value {
            return true
        }
        
        for child in children {
            let found = child.contains(value: value)
            if (found) {
                return true
            }
        }
        
        return false
    }
}

