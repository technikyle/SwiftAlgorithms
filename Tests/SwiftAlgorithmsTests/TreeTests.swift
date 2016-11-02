import XCTest
@testable import SwiftAlgorithms

class TreeTests: XCTestCase {
    
    func testInit() {
        let value = 3
        let tree = Tree<Int>(value: value)
        
        XCTAssertEqual(tree.value, value)
        
        XCTAssertEqual(tree.children.count, 0)
    }
    
    func testAdd() {
        let value = 3
        let root = Tree<Int>(value: value)
        
        let value2 = 4
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let rootChildCount = root.children.count
        XCTAssertEqual(rootChildCount, 1)

        let rootChild1 = root.children[0]
        XCTAssert(rootChild1 === child)
    }
    
    func testContains() {
        let value = 3
        let root = Tree<Int>(value: value)
        
        let value2 = 4
        let child = Tree<Int>(value: value2)
        root.add(child: child)
        
        let foundRootValue = root.contains(value:value)
        XCTAssertEqual(foundRootValue, true)
        
        let foundChildValue = root.contains(value:value2)
        XCTAssertEqual(foundChildValue, true)
        
        let notFoundChildValue = root.contains(value:0)
        XCTAssertEqual(notFoundChildValue, false)
    }
    
    static var allTests : [(String, (TreeTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),
            ("testAdd", testAdd),
            ("testContains", testContains),

        ]
    }
}
