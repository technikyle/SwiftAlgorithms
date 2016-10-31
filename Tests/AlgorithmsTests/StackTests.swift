import XCTest
@testable import Algorithms

class StackTests: XCTestCase {
    
    func testPush() {
        let stack = Stack<String>()
        
        stack.push("a")
        XCTAssertEqual(stack.size, 1)
        
        stack.push("b")
        XCTAssertEqual(stack.size, 2)

    }
    
    func testPop() {
        let stack = Stack<String>()
        
        stack.push("a")
        stack.push("b")
        
        let popped = stack.pop()
        XCTAssertEqual(popped, "b")
        XCTAssertEqual(stack.size, 1)

        let popped2 = stack.pop()
        XCTAssertEqual(popped2, "a")
        XCTAssertEqual(stack.size, 0)

        let popped3 = stack.pop()
        XCTAssertNil(popped3)
    }
    
    func testPeek() {
        let stack = Stack<String>()
        
        stack.push("a")
        stack.push("b")
        
        let peeked = stack.peek()
        XCTAssertEqual(peeked, "b")
        XCTAssertEqual(stack.size, 2)
        
        let peeked2 = stack.peek()
        XCTAssertEqual(peeked2, "b")
        XCTAssertEqual(stack.size, 2)
    }
    
    func testIsEmpty() {
        let stack = Stack<String>()
        XCTAssertEqual(stack.isEmpty(), true)

        stack.push("a")
        XCTAssertEqual(stack.isEmpty(), false)
        
        _ = stack.pop()
        XCTAssertEqual(stack.isEmpty(), true)
    }
    
    func testSize() {
        let stack = Stack<String>()
        XCTAssertEqual(stack.size, 0)
        
        stack.push("a")
        XCTAssertEqual(stack.size, 1)
        
        _ = stack.pop()
        XCTAssertEqual(stack.size, 0)
        
        _ = stack.pop()
        XCTAssertEqual(stack.size, 0)
    }
    
    static var allTests : [(String, (StackTests) -> () throws -> Void)] {
        return [
            ("testPush", testPush),
            ("testPop", testPop),
            ("testPeek", testPeek),
            ("testIsEmpty", testIsEmpty),
            ("testSize", testSize),

        ]
    }
}
