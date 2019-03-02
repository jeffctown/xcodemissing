//
//  DeleteMissingFileStepTests.swift
//  XcodeMissingFrameworkTests
//
//  Created by Jeff Lett on 2/13/19.
//

@testable import XcodeMissingFramework
import XCTest

// swiftlint:disable implicitly_unwrapped_optional force_try
class DeleteMissingFileStepTests: XCTestCase {
    let folderPath = NSTemporaryDirectory() + "DeleteFileTests"
    var swiftFilePath: String!
    var objCHeaderPath: String!
    var objCImplPath: String!
    var otherFilePath: String!

    override func setUp() {
        super.setUp()
        let folderURL = URL(fileURLWithPath: folderPath)
        swiftFilePath = folderPath + "/File.swift"
        objCHeaderPath = folderPath + "/AnotherFile.h"
        objCImplPath = folderPath + "/AnotherFile.m"
        otherFilePath = folderPath + "/AnotherFile.txt"

        try? FileManager.default.removeItem(at: folderURL)
        try! FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true)
        FileManager.default.createFile(atPath: swiftFilePath, contents: nil)
        FileManager.default.createFile(atPath: objCHeaderPath, contents: nil)
        FileManager.default.createFile(atPath: objCImplPath, contents: nil)
        FileManager.default.createFile(atPath: otherFilePath, contents: nil)
    }

    func testUnusedFilesAreDeleted() {
        let context = StepPipelineContext(verbose: false, extensions: [], path: folderPath)
        context.missingFiles.add(File(filename: swiftFilePath))
        context.missingFiles.add(File(filename: objCHeaderPath))
        context.missingFiles.add(File(filename: objCImplPath))
        do {
            try DeleteMissingFileStep().run(context: context)
            XCTAssertFalse(FileManager.default.fileExists(atPath: swiftFilePath))
            XCTAssertFalse(FileManager.default.fileExists(atPath: objCHeaderPath))
            XCTAssertFalse(FileManager.default.fileExists(atPath: objCImplPath))
            XCTAssertTrue(FileManager.default.fileExists(atPath: otherFilePath))
        } catch {
            XCTFail("Exception should not be thrown.")
        }
    }
}
