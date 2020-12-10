import XCTest
@testable import Books

final class BooksTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Books().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
