import XCTest
@testable import Swin

extension XCTestCase {
    func XCTAssertPrecondition(expectedMessage: String, block: () -> Void) {

        let expectationValue = expectation(description: "failing precondition")

        // Overwrite `precondition` with something that doesn't terminate but verifies it happened.
        preconditionClosure = { (condition, message, file, line) in
            if !condition {
                expectationValue.fulfill()
                XCTAssertEqual(message, expectedMessage, "precondition message didn't match", file: file, line: line)
            }
        }

        block()

        // Verify precondition "failed".
        waitForExpectations(timeout: 0.0, handler: nil)

        // Reset precondition.
        preconditionClosure = defaultPreconditionClosure
    }
}

class PreconditionTest: XCTestCase {
    
    func testExpectPreconditionFailure() {
        XCTAssertPrecondition(expectedMessage: "") {
            precondition(false)
        }
    }
    
    func testExpectPreconditionDefault() {
        XCTAssertPrecondition(expectedMessage: "just not true") {
            precondition(false, "just not true")
        }
    }
}
