//
//  ViewController.swift
//  cjw322_p2
//
//  Created by Cora Wu on 10/9/18.
//  Copyright © 2018 Cora Wu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var nameLabel: UILabel!
    var itemLabel: UILabel!
    var quantityLabel: UILabel!
    var itemText: UITextField!
    var quantityText: UITextField!
    var listText: UITextView!
    var addButton: UIButton!
    var removeButton: UIButton!
    var onButton: UIButton!
    
    var groceryList = [String: String]()
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.75)
        let onButtonColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1)
        let fieldColor = UIColor(red: 200.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)
        view.backgroundColor = fieldColor
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Groceries"
        nameLabel.font = UIFont.systemFont(ofSize: 45, weight: .heavy)
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        view.addSubview(nameLabel)
        
        itemLabel = UILabel()
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        itemLabel.text = "Items"
        itemLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        itemLabel.textAlignment = .left
        itemLabel.textColor = .black
        view.addSubview(itemLabel)
        
        quantityLabel = UILabel()
        quantityLabel.translatesAutoresizingMaskIntoConstraints = false
        quantityLabel.text = "Quantity"
        quantityLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        quantityLabel.textAlignment = .left
        quantityLabel.textColor = .black
        view.addSubview(quantityLabel)
        
        itemText = UITextField() // always takes user input
        itemText.translatesAutoresizingMaskIntoConstraints = false
        itemText.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        itemText.textColor = .black
        itemText.backgroundColor = .white
        view.addSubview(itemText)
        
        quantityText = UITextField()
        quantityText.translatesAutoresizingMaskIntoConstraints = false
        quantityText.font = UIFont.systemFont(ofSize: 25, weight: .regular)
        quantityText.textColor = .black
        quantityText.backgroundColor = .white
        view.addSubview(quantityText)
        
        listText = UITextView()
        listText.translatesAutoresizingMaskIntoConstraints = false
        listText.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        listText.text = "GROCERY LIST - empty\n\nNote: REMOVE removes all items of the given input regardless of quantity.\nTo change individual quantities, re-add the item."
        listText.textColor = .black
        listText.backgroundColor = .white
        listText.isEditable = false
        view.addSubview(listText)
        
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("ADD", for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        addButton.backgroundColor = buttonColor
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        addButton.addTarget(self, action: #selector (addButtonWasTapped), for: .touchUpInside)
        view.addSubview(addButton)
        
        removeButton = UIButton()
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.setTitle("REMOVE", for: .normal)
        removeButton.setTitleColor(.black, for: .normal)
        removeButton.backgroundColor = buttonColor
        removeButton.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        removeButton.addTarget(self, action: #selector (removeButtonWasTapped), for: .touchUpInside)
        view.addSubview(removeButton)


        onButton = UIButton()
        onButton.translatesAutoresizingMaskIntoConstraints = false
        onButton.setTitle("Unlocked", for: .normal)
        onButton.backgroundColor = onButtonColor
        onButton.setTitleColor(.white, for: .normal)
        onButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        onButton.addTarget(self, action: #selector(changeOnButton), for: .touchUpInside)
        view.addSubview(onButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 28),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
//            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 220),
            nameLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalToSystemSpacingBelow: nameLabel.bottomAnchor, multiplier: 5),
            itemLabel.widthAnchor.constraint(equalToConstant: 100),
            itemLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            itemLabel.heightAnchor.constraint(equalToConstant: 28)
            ])
        NSLayoutConstraint.activate([
            quantityLabel.topAnchor.constraint(equalToSystemSpacingBelow: itemLabel.bottomAnchor, multiplier: 3),
            quantityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            quantityLabel.widthAnchor.constraint(equalToConstant: 140),
            quantityLabel.heightAnchor.constraint(equalToConstant: 32)
            ])
        NSLayoutConstraint.activate([
            itemText.topAnchor.constraint(equalTo: itemLabel.topAnchor, constant: -5),
            itemText.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: 5),
            itemText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            itemText.bottomAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 5)
            ])
        NSLayoutConstraint.activate([
            quantityText.topAnchor.constraint(equalTo: quantityLabel.topAnchor, constant: -5),
            quantityText.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 5),
            quantityText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            quantityText.bottomAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 1)
            ])
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: quantityText.bottomAnchor, constant: 15),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -210),
            addButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        NSLayoutConstraint.activate([
            removeButton.topAnchor.constraint(equalTo: quantityText.bottomAnchor, constant: 15),
            removeButton.leadingAnchor.constraint(equalTo: addButton.trailingAnchor, constant: 5),
            removeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            removeButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        NSLayoutConstraint.activate([
            listText.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10),
            listText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            listText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            listText.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25)
            ])
        NSLayoutConstraint.activate([
//            onButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            onButton.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            onButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            onButton.heightAnchor.constraint(equalToConstant: 30),
            onButton.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor)
            ])
    }
    
    @objc func addButtonWasTapped() {
        
//    var groceryList = [String: String]()
        if(isOn) {
            if let realItemText = itemText.text,
                let realQuantityText = quantityText.text {
    //            listText.text += "\(realItemText) (\(realQuantityText)) \n"
                if realItemText != ""{
                    groceryList[realItemText] = realQuantityText
                    
                    listText.text = ""
                    
                    for (item, quantity) in groceryList{
                        listText.text += "ITEM: \(item)\nQUANTITY: \(quantity)\n-\n"
                    }
                }
            }
        }
    
        itemText.text = ""
        quantityText.text = ""
    }
    
    @objc func removeButtonWasTapped() {
        if (isOn) {
            if let realItemText = itemText.text {
                if groceryList.index(forKey: realItemText) != nil {
                    groceryList.removeValue(forKey: realItemText)
                }
            }
        
            listText.text = ""
        
            for (item, quantity) in groceryList{
                listText.text += "ITEM: \(item)\nQUANTITY: \(quantity)\n-\n"
            }
        }
        
        itemText.text = ""
        quantityText.text = ""
    }
    
    @objc func changeOnButton() {
          if onButton.title(for: .normal) == "Unlocked" {
             onButton.setTitle("Locked", for: .normal)
             onButton.setTitleColor(.white, for: .normal)
            isOn = false
          } else {
             onButton.setTitle("Unlocked", for: .normal)
             onButton.setTitleColor(.white, for: .normal)
            isOn = true
          }
    }
    
    
}

