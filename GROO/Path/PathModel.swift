//
//  PathModel.swift
//  GROO
//
//  Created by 이예주 on 4/19/24.
//

import SwiftUI

protocol PathModelProtocol {
    var paths: [PathType] { get set }
    
    func push(to view: PathType)
    func pop()
    func popToRootView()
}

class PathModel: PathModelProtocol, ObservableObject {
    @Published var paths: [PathType]
    
    init(paths: [PathType] = []) {
        self.paths = paths
    }
    
    func push(to view: PathType) {
        paths.append(view)
    }
    
    func pop() {
        _ = paths.popLast()
    }
    
    func popToRootView() {
        paths = []
    }
}
