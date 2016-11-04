import XCTest
@testable import SwiftAlgorithms

class QueueTests: XCTestCase {
    
    func testEnqueue() {
        let queue = Queue<String>()
        
        queue.enqueue("a")
        XCTAssertEqual(queue.size, 1)
        
        queue.enqueue("b")
        XCTAssertEqual(queue.size, 2)
    }
    
    func testDequeue() {
        let queue = Queue<String>()
        
        queue.enqueue("a")
        queue.enqueue("b")
        
        let dequeued = queue.dequeue()
        XCTAssertEqual(dequeued, "a")
        XCTAssertEqual(queue.size, 1)

        let dequeued2 = queue.dequeue()
        XCTAssertEqual(dequeued2, "b")
        XCTAssertEqual(queue.size, 0)

        let dequeued3 = queue.dequeue()
        XCTAssertNil(dequeued3)
    }
    
    func testIsEmpty() {
        let queue = Queue<String>()
        XCTAssertEqual(queue.isEmpty(), true)

        queue.enqueue("a")
        XCTAssertEqual(queue.isEmpty(), false)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.isEmpty(), true)
    }
    
    func testSize() {
        let queue = Queue<String>()
        XCTAssertEqual(queue.size, 0)
        
        queue.enqueue("a")
        XCTAssertEqual(queue.size, 1)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.size, 0)
        
        _ = queue.dequeue()
        XCTAssertEqual(queue.size, 0)
    }
    
    static var allTests : [(String, (QueueTests) -> () throws -> Void)] {
        return [
            ("testEnqueue", testEnqueue),
            ("testDequeue", testDequeue),
            ("testIsEmpty", testIsEmpty),
            ("testSize", testSize),

        ]
    }
}
