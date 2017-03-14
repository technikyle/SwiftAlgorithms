//
//  Tree.swift
//  SwiftAlgorithms
//
//  Created by Kyle Rokita on 10/25/16.
//
//

// final required for protocol TreeEnumberable children property
final public class Tree<T>: TreeEnumerable {
    public var value: T
    private(set) public var children = [Tree]()
    
    public init(value: T) {
        self.value = value
    }
    
    public func insert(_ child: Tree) {
        children.append(child)
    }
    
    public func remove(descendant: Tree) {
        let index = children.index(where: { $0 === descendant})
        if let index = index {
            children.remove(at: index)
        }
        for child in children {
            child.remove(descendant: descendant)
        }
    }
}

public protocol TreeEnumerable {
    associatedtype T
    
    var value: T { get set }
    var children: [Self] { get }
}

extension TreeEnumerable {
    public func map(_ callback: ((T) -> T) = { $0 }) -> Tree<T> {
        let mappedValue = callback(self.value)
        let tree = Tree(value: mappedValue)
        for child in self.children {
            tree.insert(child.map(callback))
        }
        return tree
    }
    
    public func depthFirstForEach(_ callback: (T, UInt) -> Void, currentDepth: UInt = 0) {
        callback(self.value, currentDepth)
        
        for child in children {
            child.depthFirstForEach(callback, currentDepth: currentDepth + 1)
        }
    }
    
    public func widthFirstForEach(_ callback: (T, UInt) -> Void) {
        var treeQueue = [(tree: Tree<T>, depth: UInt)]()
        treeQueue.append((self as! Tree<T>, 0))
        
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
    
    public func depthFirstForEach(_ callback: (T, UInt) -> Void, until: @escaping ((T, UInt) -> Bool), currentDepth: UInt = 0) {
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
    
    public func widthFirstForEach(_ callback: (T, UInt) -> Void, until: @escaping ((T, UInt) -> Bool), currentDepth: UInt = 0) {
        var treeQueue = [(tree: Tree<T>, depth: UInt)]()
        treeQueue.append((self as! Tree<T>, 0))
        
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
}

extension TreeEnumerable where T: Equatable {
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
    
    public func orderedComparison(to: Tree<T>) -> Bool {
        guard self as! Tree<T> !== to else {
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
