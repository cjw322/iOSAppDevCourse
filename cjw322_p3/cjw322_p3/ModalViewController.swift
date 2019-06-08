//
//  ModalViewController.swift
//  cjw322_p3
//
//  Created by Cora Wu on 10/21/18.
//  Copyright © 2018 Cora Wu. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    var blueText: UITextView!
    var blueView: UIView!
    var blueButton: UIButton!
    var returnButton: UIButton!
//    var arenaLabel: UILabel!
    
    weak var delegate: ChangeBlueButtonTitleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        blueText = UITextView()
        blueText.translatesAutoresizingMaskIntoConstraints = false
        blueText.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        blueText.text = blueCircleText
        blueText.textColor = .black
        blueText.backgroundColor = .white
        blueText.isEditable = true
        view.addSubview(blueText)
        
        blueButton = UIButton()
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.setTitle("Save", for: .normal)
        blueButton.backgroundColor = .white
        blueButton.layer.borderWidth = 2.0
        blueButton.layer.borderColor = UIColor.black.cgColor
        blueButton.setTitleColor(.black, for: .normal)
        blueButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        blueButton.addTarget(self, action: #selector(saveButtonWasPressed), for: .touchUpInside)
        view.addSubview(blueButton)
        
        returnButton = UIButton()
        returnButton.translatesAutoresizingMaskIntoConstraints = false
        returnButton.setTitle("Return", for: .normal)
        returnButton.backgroundColor = .white
        returnButton.layer.borderWidth = 2.0
        returnButton.layer.borderColor = UIColor.black.cgColor
        returnButton.setTitleColor(.black, for: .normal)
        returnButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        returnButton.addTarget(self, action: #selector(returnButtonWasPressed), for: .touchUpInside)
        view.addSubview(returnButton)
        
        setupConstraints()
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        blueView.center = touches.first!.location(in: view)
//    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            blueText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            blueText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            blueText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            blueText.heightAnchor.constraint(equalToConstant: 80)
            ])
        NSLayoutConstraint.activate([
            blueButton.topAnchor.constraint(equalTo: blueText.bottomAnchor, constant: 0),
            blueButton.leadingAnchor.constraint(equalTo: blueText.leadingAnchor),
            blueButton.widthAnchor.constraint(equalToConstant: 180),
            blueButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        NSLayoutConstraint.activate([
            returnButton.topAnchor.constraint(equalTo: blueButton.topAnchor),
            returnButton.leadingAnchor.constraint(equalTo: blueButton.trailingAnchor, constant: 10),
            returnButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            returnButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let rectangle = CGRect(x: 0, y: 0, width: 50, height: 50)
        blueView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        blueView.layer.cornerRadius = blueView.frame.size.width/2
        blueView.clipsToBounds = true
        
        blueView.layer.borderColor = UIColor.blue.cgColor
        blueView.layer.borderWidth = 50.0
        
//        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        blueView.center = touches.first!.location(in: view)
    }
    
    @objc func saveButtonWasPressed() {
        let text = blueText.text
        if let actualText = text, actualText != "" {
            delegate?.changeBlueButtonTitle(text: actualText)
            blueText.text = actualText
            blueCircleText = actualText
            dismiss(animated: true, completion: nil)
        } else if let actualText = text, actualText == "" {
            let alert = UIAlertController(title: "ALERT", message: "Please input a title.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
//        if let actualText = text, actualText != "" {
//            delegate?.changeButtonTitle(text: actualText)
//            dismiss(animated: true, completion: nil)
//        }
    }
    
    @objc func returnButtonWasPressed() {
        dismiss(animated: true, completion: nil)
    }
    
}

