//
//  ViewController.swift
//  DemoLocalize
//
//  Created by Ledung95d on 11/6/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit
protocol LocalizeSupportType : class {
    var language: Language { get set }
}

extension LocalizeSupportType {
    func beginLocalizing() {
        language = AppCofig.language
    }
}

class MainVC: UIViewController, LocalizeSupportType {
    
    @IBOutlet weak var countryImage: UIImageView!
    
    @IBOutlet weak var countryTitileLabel: UILabel!
    
    @IBOutlet weak var changeLangue: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        beginLocalizing()
    }
    var language: Language = .english {
        didSet{
            countryTitileLabel.text = "main_page_language".localized
            countryImage.image = "flag".localizedImage
            changeLangue.setTitle("main_page_change_languege".localized, for: .normal)
        }
    }
    
    func setupUI() {
        countryTitileLabel.text = "main_page_language".localized
        countryImage.image = "flag".localizedImage
        changeLangue.setTitle("main_page_change_languege".localized, for: .normal)
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

