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
    
    public func depthFirstMappedArray(callback: (T) -> T ) -> [T] {
        var mappedValues = [T]()
        depthFirstForEach( { (value) in
            let mappedValue = callback(value)
            mappedValues.append(mappedValue)
        })
        return mappedValues
    }
    
    public func widthFirstMappedArray(callback: (T) -> T ) -> [T] {
        var mappedValues = [T]()
        widthFirstForEach({ (value) in
            let mappedValue = callback(value)
            mappedValues.append(mappedValue)
        })
        return mappedValues
    }
    
    public func depthFirstForEach(_ callback: (T) -> Void, until: @escaping ((T) -> Bool) = { _ in return false }) {
        if !until(self.value) {
            callback(self.value)
        } else {
            return;
        }
        
        for child in children {
            var childResult = false
            func untilWrapper(value: T) -> Bool {
                let untilResult = until(value)
                childResult = untilResult
                return untilResult
            }
            child.depthFirstForEach(callback, until: untilWrapper)
            if (childResult == true) {
                break;
            }
        }
    }
    
    public func widthFirstForEach(_ callback: (T) -> Void, until: @escaping ((T) -> Bool) = { _ in return false }) {
        var treeQueue = [Tree]()
        treeQueue.append(self)
        
        while !treeQueue.isEmpty {
            let dequeuedTree = treeQueue.removeFirst()
            if !until(dequeuedTree.value) {
                callback(dequeuedTree.value)
            } else {
                break;
            }
            
            for child in dequeuedTree.children {
                treeQueue.append(child)
            }
        }
    }
}

extension Tree where T: Equatable {
    public func depthFirstSearch(value: T) -> Bool {
        var found = false
        
        depthFirstForEach({ aValue in
            if (aValue == value) {
                found = true
            }
        }, until: { (aValue) in
            return aValue == value
        })
        return found
    }
    
    public func widthFirstSearch(value: T) -> Bool {
        var found = false
        
        widthFirstForEach({ aValue in
            if (aValue == value) {
                found = true
            }
        }, until: { (aValue) in
            return aValue == value
        })
        
        return found
    }
}
