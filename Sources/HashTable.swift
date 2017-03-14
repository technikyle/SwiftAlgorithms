//
//  HashTable.swift
//  SwiftAlgorithms
//
//  Created by Kyle Rokita on 3/13/17.
//
//

import Foundation

class HashTable<Key: Hashable, Value> {
    typealias Element = (key: Key, value: Value)
    typealias Bucket = Array<Element>
    
    var buckets: [Bucket]
    
    public var isEmpty: Bool { return count == 0 }
    
    private(set) public var count = 0

    public init(capacity: UInt) {
        buckets = Array<Bucket>(repeatElement([], count: Int(capacity)))
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                _ = setValue(value, forKey: key)
            } else {
                _ = removeValue(forKey: key)
            }
        }
    }
    
    private func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        let bucket = buckets[index]
        for element in bucket {
            if element.key == key {
                return element.value
            }
        }
        return nil  // key not in hash table
    }
    
    private func setValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        // Do we already have this key in the bucket?
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                buckets[index][i].value = value
                return oldValue
            }
        }
        
        // This key isn't in the bucket yet; add it to the chain.
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    private func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        
        // Find the element in the bucket's chain and remove it.
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil  // key not in hash table
    }
    
    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue) % buckets.count
    }
}
