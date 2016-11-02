import XCTest
@testable import SwiftAlgorithms

class LinkedListTests: XCTestCase {
    func testInit() {
        let linkedList = LinkedList<Int>()
        XCTAssertNil(linkedList.first)
        XCTAssertNil(linkedList.last)
        XCTAssertEqual(linkedList.isEmpty, true)
    }
    
    func testInsertBefore() {
        let linkedList = LinkedList<Int>()
        let value1 = 1
        linkedList.insertFirst(value1)
        
        XCTAssertEqual(linkedList.first?.value, value1)
        
        let value2 = 5
        linkedList.insertFirst(value2)
        
        XCTAssertEqual(linkedList.first?.value, value2)
    }
    
    func testInsertFirst() {
        let linkedList = LinkedList<Int>()
        let value1 = 1
        linkedList.insertFirst(value1)
        
        XCTAssertEqual(linkedList.first?.value, value1)
        
        let value2 = 5
        linkedList.insertFirst(value2)

        XCTAssertEqual(linkedList.first?.value, value2)
    }
    
    func testInsertLast() {
        let linkedList = LinkedList<Int>()
        let value1 = 1
        linkedList.insertLast(value1)
        
        XCTAssertEqual(linkedList.last?.value, value1)
        
        let value2 = 5
        linkedList.insertLast(value2)
        
        XCTAssertEqual(linkedList.last?.value, value2)
    }
    
    func testRemoveFirst() {
        let linkedList = LinkedList<Int>()
        let value1 = 1
        linkedList.insertLast(value1)
        
        let value2 = 5
        linkedList.insertLast(value2)
        
        let removed = linkedList.removeFirst()
        XCTAssertEqual(removed, value1)
        
        let removed2 = linkedList.removeFirst()
        XCTAssertEqual(removed2, value2)
        
        let removed3 = linkedList.removeFirst()
        XCTAssertEqual(removed3, nil)
    }
    
    func testRemoveLast() {
        let linkedList = LinkedList<Int>()
        let value1 = 1
        linkedList.insertLast(value1)
        
        let value2 = 5
        linkedList.insertLast(value2)
        
        let removed = linkedList.removeLast()
        XCTAssertEqual(removed, value2)
        
        let removed2 = linkedList.removeLast()
        XCTAssertEqual(removed2, value1)
        
        let removed3 = linkedList.removeLast()
        XCTAssertEqual(removed3, nil)
    }
    
    func testContains() {
        let linkedList = LinkedList<Int>()

        linkedList.insertLast(5)
        linkedList.insertFirst(4)
        
        XCTAssertTrue(linkedList.contains(5))
        XCTAssertTrue(linkedList.contains(4))
        
        XCTAssertFalse(linkedList.contains(3))
    }

    func testIndexOf() {
        let linkedList = LinkedList<Int>()
        
        linkedList.insertLast(0)
        linkedList.insertLast(2)
        
        let index1 = linkedList.indexOf(0)
        XCTAssertNotNil(index1)
        XCTAssertEqual(index1!, 0)
        
        let index2 = linkedList.indexOf(2)
        XCTAssertNotNil(index2)
        XCTAssertEqual(index2!, 1)
        
        XCTAssertNil(linkedList.indexOf(6))
    }

    static var allTests : [(String, (LinkedListTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
            ("testInsertFirst", testInsertFirst),
            ("testInsertLast", testInsertLast),
            ("testRemoveFirst", testRemoveFirst),
            ("testRemoveLast", testRemoveLast),
            ("testContains", testContains),
            ("testIndexOf", testIndexOf),

        ]
    }
}

class LinkedListElementTests: XCTestCase {
    func testInit() {
        let testValue = 4
        let node = LinkedListNode(value:testValue)
        
        XCTAssertEqual(node.value, testValue)
        XCTAssertNil(node.next)
        XCTAssertNil(node.previous)
    }
    
    func testNext() {
        let testValue = 4
        let node = LinkedListNode(value:testValue)
        
        let testValue2 = 5
        let node2 = LinkedListNode(value:testValue2)
        node.next = node2
        
        XCTAssertNotNil(node.next)
        XCTAssert(node.next! === node2)
    }
    
    func testPrevious() {
        let testValue = 4
        let node = LinkedListNode(value:testValue)
        
        let testValue2 = 5
        let node2 = LinkedListNode(value:testValue2)
        node.previous = node2
        
        XCTAssertNotNil(node.previous)
        XCTAssert(node.previous! === node2)
    }
    
    static var allTests : [(String, (LinkedListElementTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
            ("testNext", testNext),
            ("testPrevious", testPrevious),
        ]
    }
}
