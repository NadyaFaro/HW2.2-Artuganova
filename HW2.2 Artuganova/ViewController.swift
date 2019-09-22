//
//  ViewController.swift
//  HW2.2 Artuganova
//
//  Created by Max on 20.09.2019.
//  Copyright © 2019 Nadzeya Artuhanava. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var screenView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!

    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    private let minimumSliderValue = Float(0)
    private let maximumSliderValue = Float(1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func changeRedValue() {
        redValue.text = String(format: "%.2f", redSlider.value)
        redTextField.text = String(format: "%.2f", redSlider.value)
        screenView.backgroundColor = changeScreenColor()
    }
    
    @IBAction func changeGreenValue() {
        greenValue.text = String(format: "%.2f", greenSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        screenView.backgroundColor = changeScreenColor()
    }
    
    @IBAction func changeBlueValue() {
        blueValue.text = String(format: "%.2f", blueSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
        screenView.backgroundColor = changeScreenColor()
    }
    
    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case redTextField:
            redTextField.resignFirstResponder()
        case greenTextField:
            greenTextField.resignFirstResponder()
        case blueTextField:
            blueTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
    
}


extension ViewController {

    private func changeScreenColor() -> UIColor {
    let screenColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        return screenColor
    }
    
    private func showAlert(title: String, massage: String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        present(alert, animated: true)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let imputValue = textField.text, !imputValue.isEmpty else { return }
        let sliderValue = Float(imputValue)!
        
        if sliderValue >= 0.0 && sliderValue <= 1.0 {
            switch textField {
        case redTextField:
            redSlider.value = sliderValue
            redValue.text = imputValue
            screenView.backgroundColor = changeScreenColor()
        case greenTextField:
            greenSlider.value = sliderValue
            greenValue.text = imputValue
            screenView.backgroundColor = changeScreenColor()
        case blueTextField:
            blueSlider.value = sliderValue
            blueValue.text = imputValue
            screenView.backgroundColor = changeScreenColor()
        default:
            break
        }
        } else {
            showAlert(title: "Wrong format", massage: "Please, enter numbers from 0.0 to 1.0")
        }
    }    
    
    private func setUpView() {
        screenView.layer.cornerRadius = 10
        
        redLabel.text = "Red:"
        greenLabel.text = "Green:"
        blueLabel.text = "Blue:"
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.maximumTrackTintColor = .white
        greenSlider.maximumTrackTintColor = .white
        blueSlider.maximumTrackTintColor = .white
        
        redSlider.minimumValue = minimumSliderValue
        redSlider.maximumValue = maximumSliderValue
        greenSlider.minimumValue = minimumSliderValue
        greenSlider.maximumValue = maximumSliderValue
        blueSlider.minimumValue = minimumSliderValue
        blueSlider.maximumValue = maximumSliderValue
        
        redSlider.value = maximumSliderValue * 0.25
        greenSlider.value = maximumSliderValue * 0.5
        blueSlider.value = maximumSliderValue * 0.75
        
        redValue.text = String(redSlider.value)
        greenValue.text = String(greenSlider.value)
        blueValue.text = String(blueSlider.value)
        
        redTextField.text = String(redSlider.value)
        greenTextField.text = String(greenSlider.value)
        blueTextField.text = String(blueSlider.value)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        screenView.backgroundColor = changeScreenColor()
    }
}
