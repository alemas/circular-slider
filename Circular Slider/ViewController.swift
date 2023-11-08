//
//  ViewController.swift
//  Circular Slider
//
//  Created by Mateus Reckziegel on 18/09/2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var circularSlider: CircularSliderView = {
        let view = CircularSliderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View"
        view.backgroundColor =  .white
        setupLayout()
    }

    private func setupLayout() {
        view.addSubview(circularSlider)
        
        NSLayoutConstraint.activate([
            circularSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circularSlider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            circularSlider.heightAnchor.constraint(equalToConstant: 200),
            circularSlider.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

}

