//
//  ViewController.swift
//  Themes
//
//  Created by Elias Ferreira on 08/03/21.
//

import UIKit

class ViewController: UIViewController {

    let configurations = Configurations.getInstance()

    @IBOutlet weak var themeMenu: UISegmentedControl!

    @IBAction func didChange(_ sender: UISegmentedControl) {
        updateTheme(theme: UIUserInterfaceStyle(rawValue: sender.selectedSegmentIndex) ?? .unspecified)
    }

    @IBAction func alertAction(_ sender: Any) {
        let alert = UIAlertController(title: "Teste", message: "Este é um teste do alerto controller no dark mode!", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }

    func updateTheme(theme: UIUserInterfaceStyle) {

        configurations.theme = theme

        UIView.transition(
            with: self.view,
            duration: 0.5,
            options: .transitionCrossDissolve,
            animations: {
                self.view.window?.overrideUserInterfaceStyle = theme
            },
            completion: nil
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appBlue
        themeMenu.selectedSegmentIndex = configurations.theme.rawValue
    }

}

