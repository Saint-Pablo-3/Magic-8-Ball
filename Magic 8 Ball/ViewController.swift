//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by админ on 14.01.2023.
//

import UIKit

class ViewController: UIViewController {
//    create an answer's array
    let options = ["Yes", "No", "Why", "Sure", "Don't!", "GO!" ]
    
//    create an asking label
    let label: UILabel = {
        let label = UILabel()
        label.text = "Ask Me Anything"
        label.font = UIFont(name: "Arial", size: 34)
//        label.font.withSize(34)
        label.textColor = .white
        return label
    }()
//    
//      create an internal answering label
    var intLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Arial", size: 10)
        label.textColor = .white
        return label
    }()
 
    
//    create a button
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Ask", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.red, for: .highlighted)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 10
        button.addTarget(ViewController.self, action: #selector(tapButton) , for: .touchUpInside)
        return button
    }()
    
//    create an ImageView
    var imageView = UIImageView()

//    create an Image
    let image = UIImage(named: "Magic_eight_ball")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        imageView.image = image
        intLabel.text = options.randomElement()
        addElements()
        
    }
 
    @objc func tapButton(sender: UIButton) {
        intLabel.text = options.randomElement()
    }
    
// crrating and adding elements of view func
    func addElements() {
        //adding on view and removing masks
        [imageView, button, label, intLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        //setting constraints
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: -34),
            intLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            intLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    

}

