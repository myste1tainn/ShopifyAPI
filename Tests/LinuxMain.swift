import XCTest

import ShopifyAPITests

var tests = [XCTestCaseEntry]()
tests += ShopifyAPITests.allTests()
XCTMain(tests)