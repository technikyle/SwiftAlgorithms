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
    
    static var allTests : [(String, (BinarySearchTreeTests) -> () throws -> Void)] {
        return [
            ("testInit", testInit),

        ]
    }
}
