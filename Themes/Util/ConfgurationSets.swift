//
//  ConfgurationSets.swift
//  Themes
//
//  Created by Elias Ferreira on 08/03/21.
//

import UIKit

enum ConfigKeys {
    case theme
    var key: String {
        switch self {
        case .theme:
            return "theme"
        }
    }
}

class Configurations {

    private static var configurations: Configurations?
    private var userDefaults: UserDefaults

    private init () {
        userDefaults = UserDefaults.standard
    }

    static func getInstance() -> Configurations {
        if Configurations.configurations == nil {
            Configurations.configurations = Configurations()
        }
        return Configurations.configurations!
    }

    var theme: UIUserInterfaceStyle  {
        get {
            UIUserInterfaceStyle(
                rawValue: userDefaults.value(
                    forKey: ConfigKeys.theme.key
                ) as! Int
            ) ?? .unspecified
        }

        set {
            userDefaults.setValue(
                newValue.rawValue,
                forKey: ConfigKeys.theme.key
            )
        }
    }

}
