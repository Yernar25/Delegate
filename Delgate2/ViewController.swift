//
//  ViewController.swift
//  Delgate2
//
//  Created by Yernar Dyussenbekov on 08.12.2024.
//

import UIKit

protocol AddListProtocol {
    func addListArray(_ cellText: String)
}

class ViewController: UIViewController, UIGestureRecognizerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var textField: UITextField!
   
    var delegate: AddListProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view.
        backgroundView.layer.cornerRadius = 20
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: backgroundView))! {
            return false
        }
        return true
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }

    @IBAction func add(_ sender: Any) {
        delegate?.addListArray(textField.text!)
        dismissView()
        
    }
    
    
    
}

