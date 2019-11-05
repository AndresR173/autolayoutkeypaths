//
//  ViewController.swift
//  AutoLayoutKeyPaths
//
//  Created by Andres Rojas on 5/11/19.
//  Copyright © 2019 Andres Rojas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Helper Methods

    private func configureUI() {
        view.backgroundColor = .white

        let button = UIButton()
        button.setTitle("test", for: .normal)
        button.backgroundColor = .red

        let label = UILabel()
        label.text = "Label"
        label.textColor = .black
        label.backgroundColor = .gray

        let container = UIView()
        container.backgroundColor = .green

        view.addSubview(label, constraints: [
            equal(\.topAnchor, constant: 100),
            equal(\.leadingAnchor, constant: 24),
            equal(\.trailingAnchor, constant: -24),
            equal(\.heightAnchor, constant: 21)
        ])

        view.addSubview(button, constraints: [
            equal(\.topAnchor, label.bottomAnchor, constant: 24),
            equal(\.heightAnchor, constant: 44),
            equal(\.leftAnchor),
            equal(\.rightAnchor)
        ])

        view.addSubview(container, constraints: [
            equal(\.topAnchor, button.bottomAnchor, constant: 24),
            equal(\.centerXAnchor, \.centerXAnchor),
            equal(\.widthAnchor, constant: 100),
            equal(\.heightAnchor, container.widthAnchor, multiplier: 0.5)
        ])

        let _ = equal(\.topAnchor, \.bottomAnchor) (container, container)
    }

}

