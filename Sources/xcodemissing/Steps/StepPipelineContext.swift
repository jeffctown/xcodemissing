//
//  StepPipelineContext.swift
//  xcodemissing
//
//  Created by Jeff Lett on 2/12/19.
//

import Foundation
import xcodeproj
import PathKit

class StepPipelineContext {
    let verbose: Bool
    let extensions: [String]
    let path: Path
    var files = [String: Int]()
    var xcodeProjects = [XcodeProj]()
    var unusedFiles = [String]()
    
    init(verbose: Bool, extensions: [String], path: Path) {
        self.verbose = verbose
        self.extensions = extensions
        self.path = path
    }
}
