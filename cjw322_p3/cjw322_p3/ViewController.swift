//
//  ViewController.swift
//  cjw322_p3
//
//  Created by Cora Wu on 10/21/18.
//  Copyright © 2018 Cora Wu. All rights reserved.
//

import UIKit

var redSquareText = "Red Square Arena"
var blueCircleText = "Blue Circle Arena"
var magicalOrigText = "Magical Arena"

protocol ChangeButtonTitleDelegate: class {
    func changeButtonTitle(text: String)
}

protocol ChangeBlueButtonTitleDelegate: class {
    func changeBlueButtonTitle(text: String)
}

protocol ChangeMagicalButtonTitleDelegate: class {
    func changeMagicalButtonTitle(text: String)
}

class ViewController: UIViewController {
//    var pushNavViewControllerButton: UIButton!
    var presentModalViewControllerButton: UIButton!
    var redSquareButton: UIButton!
    var blueCircleButton: UIButton!
    var magicalButton: UIButton!
    var arenaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Drawing Arenas"
        
        arenaLabel = UILabel()
        arenaLabel.translatesAutoresizingMaskIntoConstraints = false
        arenaLabel.text = "Arenas"
        arenaLabel.font = UIFont.systemFont(ofSize: 50, weight: .heavy)
        arenaLabel.textAlignment = .left
        arenaLabel.textColor = .black
        view.addSubview(arenaLabel)
        
        redSquareButton = UIButton()
        redSquareButton.translatesAutoresizingMaskIntoConstraints = false
        redSquareButton.setTitle("Red Square Arena", for: .normal)
        redSquareButton.backgroundColor = .red
        redSquareButton.setTitleColor(.white, for: .normal)
        redSquareButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        redSquareButton.addTarget(self, action: #selector(redSquareButtonWasTapped), for: .touchUpInside)
        view.addSubview(redSquareButton)
        
        blueCircleButton = UIButton()
        blueCircleButton.translatesAutoresizingMaskIntoConstraints = false
        blueCircleButton.setTitle("Blue Circle Arena", for: .normal)
        blueCircleButton.backgroundColor = .blue
        blueCircleButton.setTitleColor(.white, for: .normal)
        blueCircleButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        blueCircleButton.addTarget(self, action: #selector(blueCircleButtonWasTapped), for: .touchUpInside)
        view.addSubview(blueCircleButton)
        
        magicalButton = UIButton()
        magicalButton.translatesAutoresizingMaskIntoConstraints = false
        magicalButton.setTitle("Magical Arena", for: .normal)
        magicalButton.backgroundColor = .white
        magicalButton.setTitleColor(.black, for: .normal)
        magicalButton.layer.borderWidth = 2.0
        magicalButton.layer.borderColor = UIColor.black.cgColor
        magicalButton.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        magicalButton.addTarget(self, action: #selector(magicalButtonWasTapped), for: .touchUpInside)
        view.addSubview(magicalButton)
        
        
//        present(ModalViewController(), animated: true, completion: nil)
        
//        presentModalViewControllerButton = UIButton()
//        presentModalViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
//        presentModalViewControllerButton.setTitle("Present Modal VC [change my name]", for: .normal)
//        presentModalViewControllerButton.setTitleColor(.red, for: .normal)
//        presentModalViewControllerButton.addTarget(self, action: #selector(presentModalViewController), for: .touchUpInside)
//        view.addSubview(presentModalViewControllerButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            arenaLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            arenaLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            //            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            arenaLabel.widthAnchor.constraint(equalToConstant: 220),
            arenaLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            redSquareButton.topAnchor.constraint(equalTo: arenaLabel.bottomAnchor, constant: 50),
            redSquareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            redSquareButton.widthAnchor.constraint(equalToConstant: 300),
            redSquareButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            blueCircleButton.topAnchor.constraint(equalTo: redSquareButton.bottomAnchor, constant: 50),
            blueCircleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            blueCircleButton.widthAnchor.constraint(equalToConstant: 300),
            blueCircleButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            magicalButton.topAnchor.constraint(equalTo: blueCircleButton.bottomAnchor, constant: 50),
            magicalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            magicalButton.widthAnchor.constraint(equalToConstant: 300),
            magicalButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        
//        NSLayoutConstraint.activate([
//            presentModalViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            presentModalViewControllerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            presentModalViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
//            ])
    }
    
    @objc func redSquareButtonWasTapped() {
//        present(ModalViewController(), animated: true, completion: nil)
        let redSquareViewController = NavViewController()
        redSquareViewController.delegate = self
        navigationController?.pushViewController(redSquareViewController, animated: true)
    }
    
    @objc func blueCircleButtonWasTapped() {
        // present new view controllers modally using present method
        let modalViewController = ModalViewController()
        modalViewController.delegate = self
        present(modalViewController, animated: true, completion: nil)
    }
    
    @objc func magicalButtonWasTapped() {
        // present new view controllers modally using present method
        let magicalViewController = MNavViewController()
        magicalViewController.delegate = self
        navigationController?.pushViewController(magicalViewController, animated: true)
    }

}

extension ViewController: ChangeButtonTitleDelegate {
    func changeButtonTitle(text: String) {
        redSquareButton.setTitle(text, for: .normal)
        
    }
//    func changeBlueButtonTitle(text: String) {
//        blueCircleButton.setTitle(text, for: .normal)
//
//    }
}

extension ViewController: ChangeBlueButtonTitleDelegate {
    func changeBlueButtonTitle(text: String) {
        blueCircleButton.setTitle(text, for: .normal)

    }
}

extension ViewController: ChangeMagicalButtonTitleDelegate {
    func changeMagicalButtonTitle(text: String) {
        magicalButton.setTitle(text, for: .normal)
    }
}
