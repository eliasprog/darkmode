//
//  ConfigKeys.swift
//  Themes
//
//  Created by Elias Ferreira on 08/03/21.
//

import Foundation

enum ConfigKeys {
    case theme
    var key: String {
        switch self {
        case .theme:
            return "theme"
        }
    }
}

