import XCTest
@testable import SwiftAlgorithms

class BinarySearchTreeTests: XCTestCase {
    
    func testInit() {
        let value = 3
        let tree = BinarySearchTree<Int>(value: value)
        
        XCTAssertEqual(tree.value, value)
        
        XCTAssertNil(tree.left)
        XCTAssertNil(tree.right)
    }
    
    func testInsertLesserValue() {
        let value1 = 3
        let tree = BinarySearchTree<Int>(value: value1)
        
        let value2 = 1
        tree.insert(value2)
        XCTAssertNotNil(tree.left)
        XCTAssertEqual(tree.left!.value, value2)
        XCTAssertNil(tree.right)
    }
    
    func testInsertGreaterValue() {
        let value1 = 3
        let tree = BinarySearchTree<Int>(value: value1)
        
        let value2 = 5
        tree.insert(value2)
        XCTAssertNotNil(tree.right)
        XCTAssertEqual(tree.right!.value, value2)
        XCTAssertNil(tree.left)
    }
    
    func testInsertEqualValue() {
        let value = 3
        let tree = BinarySearchTree<Int>(value: value)
        
        tree.insert(value)
        XCTAssertNotNil(tree.right)
        XCTAssertEqual(tree.right!.value, value)
        XCTAssertNil(tree.left)
    }
    
    func testBinarySearch() {
        let value1 = 3
        let tree = BinarySearchTree<Int>(value: value1)
        
        let value2 = 2
        tree.insert(value2)
        
        let value3 = 1
        tree.insert(value3)
        
        let value4 = 1
        tree.insert(value4)
        
        let value5 = 5
        tree.insert(value5)
        
        let value6 = 4
        tree.insert(value6)
        
        XCTAssert(tree.binarySearch(value1))
        XCTAssert(tree.binarySearch(value2))
        XCTAssert(tree.binarySearch(value3))
        XCTAssert(tree.binarySearch(value4))
        XCTAssert(tree.binarySearch(value5))
        XCTAssert(tree.binarySearch(value6))

        XCTAssertFalse(tree.binarySearch(0))

    }
    
    static var allTests : [(String, (BinarySearchTreeTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
            ("testInsertLesserValue", testInsertLesserValue),
            ("testInsertGreaterValue", testInsertGreaterValue),
            ("testInsertEqualValue", testInsertEqualValue),
            ("testBinarySearch", testBinarySearch),

        ]
    }
}
