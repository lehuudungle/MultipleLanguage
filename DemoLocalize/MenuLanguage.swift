//
//  MenuLanguage.swift
//  DemoLocalize
//
//  Created by Ledung95d on 11/6/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class MenuLanguage: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func changeLanguage(_ sender: Any) {
        
        let alert = UIAlertController(title: "alert_change_language".localized, message: nil, preferredStyle: .actionSheet)
        func addActionLanguage(language: Language) {
            alert.addAction(UIAlertAction(
                title: language.rawValue.localized,
                style: .default,
                handler: { _  in
                    AppCofig.language = language
            })
            )
        }
        addActionLanguage(language: .english)
        addActionLanguage(language: .vietnam)
        alert.addAction(UIAlertAction(title: "alert_cancel".localized, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
