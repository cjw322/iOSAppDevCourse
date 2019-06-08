//
//  MNavViewController.swift
//  cjw322_p3
//
//  Created by Cora Wu on 10/21/18.
//  Copyright © 2018 Cora Wu. All rights reserved.
//


import UIKit

class MNavViewController: UIViewController {
    var magicalView: UIView!
    var magicalText: UITextView!
    var magicalSlider: UISlider!
    var magicalWidth = 50
    var magicalHeight = 50
    //    var saveButton = UIBarButtonItem!
    weak var delegate: ChangeMagicalButtonTitleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        //        title = "Drawing Arenas"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonWasTapped))
        
        magicalText = UITextView()
        magicalText.translatesAutoresizingMaskIntoConstraints = false
        magicalText.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        magicalText.text = magicalOrigText
        magicalText.textColor = .black
        magicalText.backgroundColor = .white
        magicalText.isEditable = true
        view.addSubview(magicalText)
        
        magicalSlider = UISlider(frame:CGRect(x: 30, y: 200, width: 350, height: 20))
        magicalSlider.minimumValue = 0
        magicalSlider.maximumValue = 150
        magicalSlider.isContinuous = true
        magicalSlider.tintColor = UIColor.black
        magicalSlider.addTarget(self, action: #selector(sliderValueDidChange(_:)), for: .valueChanged)
        self.view.addSubview(magicalSlider)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            magicalText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            magicalText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            magicalText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            magicalText.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        magicalView = UIView(frame: CGRect(x: 0, y: 0, width: magicalWidth, height: magicalHeight))
        let randomColor = UIColor(red: CGFloat(Double(Int.random(in: 0..<255))/255.0), green: CGFloat(Double(Int.random(in: 0..<255))/255.0), blue: CGFloat(Double(Int.random(in: 0..<255))/255.0), alpha: 1.0)
        magicalView.backgroundColor = randomColor
        view.addSubview(magicalView)
        magicalView.center = touches.first!.location(in: view)
    }
    
    @objc func saveButtonWasTapped() {
        let text = magicalText.text
        if let actualText = text, actualText != "" {
            delegate?.changeMagicalButtonTitle(text: actualText)
            magicalText.text = actualText
            magicalOrigText = actualText
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
        magicalWidth = Int(sender.value)
        magicalHeight = Int(sender.value)
        //        print("Slider value changed")
        //
        //        // Use this code below only if you want UISlider to snap to values step by step
        //        let roundedStepValue = round(sender.value / step) * step
        //        sender.value = roundedStepValue
        //
        //        print("Slider step value \(Int(roundedStepValue))")
    }
}

