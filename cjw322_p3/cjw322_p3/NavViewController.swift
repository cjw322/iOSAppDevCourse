//
//  NavViewController.swift
//  cjw322_p3
//
//  Created by Cora Wu on 10/21/18.
//  Copyright © 2018 Cora Wu. All rights reserved.
//

import UIKit


class NavViewController: UIViewController {
    var redView: UIView!
    var redText: UITextView!
    var redSlider: UISlider!
//    var saveButton = UIBarButtonItem!
    weak var delegate: ChangeButtonTitleDelegate?
    
    var redWidth = 50
    var redHeight = 50

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
//        title = "Drawing Arenas"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonWasTapped))
        
        redText = UITextView()
        redText.translatesAutoresizingMaskIntoConstraints = false
        redText.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        redText.text = redSquareText
        redText.textColor = .black
        redText.backgroundColor = .white
        redText.isEditable = true
        view.addSubview(redText)
        
        redSlider = UISlider(frame:CGRect(x: 30, y: 200, width: 350, height: 20))
        redSlider.minimumValue = 0
        redSlider.maximumValue = 150
        redSlider.isContinuous = true
        redSlider.tintColor = UIColor.red
        redSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        self.view.addSubview(redSlider)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            redText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            redText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            redText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            redText.heightAnchor.constraint(equalToConstant: 100)
            ])
//        NSLayoutConstraint.activate([
//            redSlider.topAnchor.constraint(equalTo: redText.topAnchor, constant: 120),
//            redSlider.leadingAnchor.constraint(equalTo: redText.leadingAnchor),
//            redSlider.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
//            redSlider.heightAnchor.constraint(equalToConstant: 100)
//            ])
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        redView = UIView(frame: CGRect(x: 0, y: 0, width: redWidth, height: redHeight))
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.center = touches.first!.location(in: view)
    }
    
    @objc func saveButtonWasTapped() {
        let text = redText.text
        if let actualText = text, actualText != "" {
            delegate?.changeButtonTitle(text: actualText)
            redText.text = actualText
            redSquareText = actualText
            self.navigationController?.popViewController(animated: true)
        } else if let actualText = text, actualText == "" {
            let alert = UIAlertController(title: "ALERT", message: "Please input a title.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!)
    {
        redWidth = Int(sender.value)
        redHeight = Int(sender.value)
//        print("Slider value changed")
//
//        // Use this code below only if you want UISlider to snap to values step by step
//        let roundedStepValue = round(sender.value / step) * step
//        sender.value = roundedStepValue
//
//        print("Slider step value \(Int(roundedStepValue))")
    }
}
