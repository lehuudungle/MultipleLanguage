//
//  AppConfig.swift
//  DemoLocalize
//
//  Created by Ledung95d on 11/6/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import Foundation
import UIKit

private let appleLanguagesKey = "AppleLanguages"
class AppCofig {
    static var language: Language {
        get {
            if let languageCode = UserDefaults.standard.string(forKey: appleLanguagesKey),
                let language = Language(rawValue: languageCode) {
                return language
            } else {
                let preferredLanguage = NSLocale.preferredLanguages[0] as String
                print("danh sach: \(preferredLanguage)")
                let index = preferredLanguage.index(
                    preferredLanguage.startIndex,
                    offsetBy: 2
                )
                guard let localization = Language(
                    rawValue: preferredLanguage.substring(to: index)
                    ) else {
                        return Language.english
                }
                
                return localization
            }
        }
        set {
            guard language != newValue else {
                return
            }
            
            //change language in the app
            //the language will be changed after restart
            UserDefaults.standard.set([newValue.rawValue], forKey: appleLanguagesKey)
            UserDefaults.standard.synchronize()
            
            //Changes semantic to all views
            //this hack needs in case of languages with different semantics: leftToRight(en/uk) & rightToLeft(ar)
            UIView.appearance().semanticContentAttribute = newValue.semantic
            
            //initialize the app from scratch
            //show initial view controller
            //so it seems like the is restarted
            //NOTE: do not localize storboards
            //After the app restart all labels/images will be set
            //see extension String below
            //            UIApplication.shared.windows[0].rootViewController = UIStoryboard(
            //                name: "Main",
            //                bundle: nil
            //                ).instantiateInitialViewController()
        }
    }
}
