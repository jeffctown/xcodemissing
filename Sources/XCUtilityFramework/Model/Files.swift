//
//  Files.swift
//  XCUtilityFramework
//
//  Created by Jeff Lett on 2/15/19.
//

import Foundation
import PathKit

struct Files {
    private var files = [String: File]()

    init(array: [File] = []) {
        array.forEach { add($0) }
    }

    func file(for path: Path) -> File? {
        // these are lowercased for a reason.
        // the file system in MacOS is case insensitive, but case preserving.
        return files[path.string.lowercased()]
    }

    mutating func add(_ file: File) {
        files[file.path.string.lowercased()] = file
    }

    var all: [File] {
        return Array(files.values)
    }
}
