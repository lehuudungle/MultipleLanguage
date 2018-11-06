//
//  Localize.swift
//  DemoLocalize
//
//  Created by Ledung95d on 11/6/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit

enum Language: String {
    
    case english = "en"
    case arabic = "ar"
    case ukrainian = "uk"
    case vietnam = "vi"
    
    var semantic: UISemanticContentAttribute {
        switch self {
        case .english, .ukrainian:
            return .forceLeftToRight
        case .arabic:
            return .forceRightToLeft
        case .vietnam:
            return .forceLeftToRight
        }
    }
}


extension String {
    
    var localized: String {
        return Bundle.localizedBundle.localizedString(forKey: self, value: nil, table: nil)
    }
    
    var localizedImage: UIImage? {
        return localizedImage()
            ?? localizedImage(type: ".png")
            ?? localizedImage(type: ".jpg")
            ?? localizedImage(type: ".jpeg")
            ?? UIImage(named: self)
    }
    
    private func localizedImage(type: String = "") -> UIImage? {
        print("nameImage : \(Bundle.localizedBundle) path: \(self)")
        guard let imagePath = Bundle.localizedBundle.path(forResource: self, ofType: type) else {
            return nil
        }
        return UIImage(contentsOfFile: imagePath)
    }
}

extension Bundle {
    //Here magic happens
    //when you localize resources: for instance Localizable.strings, images
    //it creates different bundles
    //we take appropriate bundle according to language
    static var localizedBundle: Bundle {
        let languageCode = AppCofig.language.rawValue
        guard let path = Bundle.main.path(forResource: languageCode, ofType: "lproj") else {
            return Bundle.main
        }
        return Bundle(path: path)!
    }
}
