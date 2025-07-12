//
//  PathModel.swift
//  MindPrep
//
//  Created by 어재선 on 7/13/25.
//

import Foundation

class PathModel: ObservableObject {
    @Published var paths: [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
}
