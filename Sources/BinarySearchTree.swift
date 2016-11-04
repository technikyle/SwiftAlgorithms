//
//  BinarySearchTree.swift
//  SwiftAlgorithms
//
//  Created by Kyle Rokita on 10/25/16.
//
//

public class BinarySearchTree<T> {
    public var value: T
    public var left: BinarySearchTree?
    public var right: BinarySearchTree?

    public init(value: T) {
        self.value = value
    }
}

extension BinarySearchTree where T: Equatable {

}

extension Collection {
    
    func forEachWhile(_ callback: (Self.Iterator.Element) -> Bool ) {
        for item in self {
            if (!callback(item)) {
                break;
            }
        }
    }
    
}
