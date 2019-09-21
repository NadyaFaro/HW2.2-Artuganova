//
//  ViewController.swift
//  HW2.2 Artuganova
//
//  Created by Max on 20.09.2019.
//  Copyright © 2019 Nadzeya Artuhanava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

    @IBAction func changeRedValue() {
    }
    @IBAction func changeGreenValue() {
    }
    @IBAction func changeBlueValue() {
    }
}


extension ViewController {
    
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
        
    }
}
