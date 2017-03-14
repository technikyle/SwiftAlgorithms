//
//  HashTableTests.swift
//  SwiftAlgorithms
//
//  Created by Kyle Rokita on 3/14/17.
//
//

import XCTest
@testable import SwiftAlgorithms

class HashTableTests: XCTestCase {

    func testInit() {
        let hashTable = HashTable<String, Int>(capacity: 500)
        
        XCTAssert(hashTable.count == 0)
        XCTAssert(hashTable.isEmpty == true)
    }
    
    func testAddKeys() {
        let hashTable = HashTable<String, Int>(capacity: 500)
        
        hashTable["apple"] = 4
        hashTable["orange"] = 2
        
        XCTAssert(hashTable.count == 2)
        XCTAssert(hashTable.isEmpty == false)
        
        XCTAssert(hashTable["apple"] == 4)
        XCTAssert(hashTable["orange"] == 2)
    }
    
    func testRemoveKeys() {
        let hashTable = HashTable<String, Int>(capacity: 500)
        
        hashTable["apple"] = 4
        hashTable["orange"] = 2
        
        XCTAssert(hashTable.count == 2)
        XCTAssert(hashTable.isEmpty == false)
        
        hashTable["apple"] = nil
        
        XCTAssert(hashTable.count == 1)
        XCTAssert(hashTable.isEmpty == false)
    }

    func testSameKeys() {
        let hashTable = HashTable<String, Int>(capacity: 500)
        
        hashTable["apple"] = 4
        hashTable["apple"] = 2
        
        XCTAssert(hashTable["apple"] == 2)
        XCTAssert(hashTable.count == 1)
        XCTAssert(hashTable.isEmpty == false)
        
    }
}
