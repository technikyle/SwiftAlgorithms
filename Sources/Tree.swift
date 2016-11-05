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
    
    public func insert(_ child: Tree) {
        children.append(child)
    }
    
    public func map(_ callback: ((T) -> T) = { $0 }) -> Tree {
        let mappedValue = callback(self.value)
        let tree = Tree(value: mappedValue)
        for child in self.children {
            tree.insert(child.map(callback))
        }
        return tree
    }
    
    public func depthFirstForEach(_ callback: (T, UInt) -> Void) {
        depthFirstForEach(callback, currentDepth: 0)
    }
    
    private func depthFirstForEach(_ callback: (T, UInt) -> Void, currentDepth: UInt) {
        callback(self.value, currentDepth)
        
        for child in children {
            child.depthFirstForEach(callback, currentDepth: currentDepth + 1)
        }
    }
    
    public func widthFirstForEach(_ callback: (T, UInt) -> Void) {
        var treeQueue = [(tree: Tree, depth: UInt)]()
        treeQueue.append((self, 0))
        
        while !treeQueue.isEmpty {
            let dequeued = treeQueue.removeFirst()
            let tree = dequeued.tree
            let depth = dequeued.depth

            callback(tree.value, depth)
            
            for child in tree.children {
                treeQueue.append((child, depth + 1))
            }
        }
    }
    
    public func depthFirstForEach(_ callback: (T, UInt) -> Void, until: @escaping ((T, UInt) -> Bool)) {
        depthFirstForEach(callback, until: until, currentDepth: 0)
    }
    
    private func depthFirstForEach(_ callback: (T, UInt) -> Void, until: @escaping ((T, UInt) -> Bool), currentDepth: UInt) {
        if !until(self.value, currentDepth) {
            callback(self.value, currentDepth)
        } else {
            return;
        }
        
        for child in children {
            var childResult = false
            func untilWrapper(value: T, currentDepth: UInt) -> Bool {
                let untilResult = until(value, currentDepth)
                childResult = untilResult
                return untilResult
            }
            child.depthFirstForEach(callback, until: untilWrapper, currentDepth: currentDepth + 1)
            if (childResult == true) {
                break;
            }
        }
    }
    
    public func widthFirstForEach(_ callback: (T, UInt) -> Void, until: @escaping ((T, UInt) -> Bool)) {
        widthFirstForEach(callback, until: until, currentDepth: 0)
    }
    
    private func widthFirstForEach(_ callback: (T, UInt) -> Void, until: @escaping ((T, UInt) -> Bool), currentDepth: UInt) {
        var treeQueue = [(tree: Tree, depth: UInt)]()
        treeQueue.append((self, 0))
        
        while !treeQueue.isEmpty {
            let dequeued = treeQueue.removeFirst()
            let tree = dequeued.tree
            let depth = dequeued.depth

            if !until(tree.value, depth) {
                callback(tree.value, depth)
            } else {
                break;
            }
            
            for child in tree.children {
                treeQueue.append((child, depth + 1))
            }
        }
    }
    
    public func depthFirstMap(_ callback: (T) -> T = { $0 } ) -> [T] {
        var mappedValues = [T]()
        depthFirstForEach({ value, depth in
            let mappedValue = callback(value)
            mappedValues.append(mappedValue)
        })
        return mappedValues
    }
    
    public func widthFirstMap(_ callback: (T) -> T = { $0 } ) -> [T] {
        var mappedValues = [T]()
        widthFirstForEach({ value, depth in
            let mappedValue = callback(value)
            mappedValues.append(mappedValue)
        })
        return mappedValues
    }
}

extension Tree where T: Equatable {
    public func depthFirstSearch(value: T) -> Bool {
        var found = false
        
        depthFirstForEach({ aValue, aDepth in
            if (aValue == value) {
                found = true
            }
        }, until: { (aValue) in
            return found == true
        })
        return found
    }
    
    public func widthFirstSearch(value: T) -> Bool {
        var found = false
        
        widthFirstForEach({ aValue, aDepth in
            if (aValue == value) {
                found = true
            }
        }, until: { (aValue) in
            return found == true
        })
        
        return found
    }
    
    public func orderedComparison(to: Tree) -> Bool {
        guard self !== to else {
            return true
        }
        
        guard self.value == to.value else {
            return false
        }
        
        guard self.children.count == to.children.count else {
            return false
        }
        
        for index in 0 ..< self.children.count {
            let child1 = self.children[index]
            let child2 = to.children[index]
            if !child1.orderedComparison(to: child2) {
                return false
            }
        }
        
        return true
    }
}
