//
//  Config.swift
//  GROO
//
//  Created by isabella joo on 6/3/24.
//

import Foundation

public enum Config {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let LibraryAPIKey = "LIBRARY_API_KEY"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dictionary = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dictionary
    }()
    
    // MARK: - Plist values
    static let libraryAPIKey: String = {
        guard let libraryAPIKeyString = Config.infoDictionary[Keys.Plist.LibraryAPIKey] as? String else {
            fatalError("Library API Key not set in plist for this environment")
        }
        return libraryAPIKeyString
    }()
}
