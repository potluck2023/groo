//
//  Log.swift
//  Bookable
//
//  Created by 이예주 on 2023/04/23.
//

import Foundation

/// docs
public func Log<T>(_ object: T?, filename: String = #file, line: Int = #line, funcName: String = #function) {
    #if DEBUG
    if let obj = object {
        print("📚\(Date()) \(filename.components(separatedBy: "/").last ?? "")(\(line)) : \(funcName) : \(obj)")
    } else {
        print("📚\(Date()) \(filename.components(separatedBy: "/").last ?? "")(\(line)) : \(funcName) : nil")
    }
    #endif
}
