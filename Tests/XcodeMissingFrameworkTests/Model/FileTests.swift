//
//  FileTests.swift
//  AEXML
//
//  Created by Jeff Lett on 2/15/19.
//

import Foundation
@testable import XcodeMissingFramework
import XCTest

class FileTests: XCTestCase {
    func testComparable() {
        let file1 = File(filename: "a")
        let file2 = File(filename: "b")
        XCTAssert(file1 < file2)
    }
}
