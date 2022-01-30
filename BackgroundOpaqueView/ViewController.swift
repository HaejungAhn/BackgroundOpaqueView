//
//  ViewController.swift
//  BackgroundOpaqueView
//
//  Created by WAI on 2022/01/30.
//

import UIKit

class ViewController: UIViewController {

    private let mainSB = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func popupButtonTapped(_ sender: Any) {
        let v = mainSB.instantiateViewController(withIdentifier: "PopupViewController")
        v.modalPresentationStyle = .overFullScreen
        self.present(v, animated: false, completion: nil)
    }
    
    @IBAction func bottomUpMenuTapped(_ sender: Any) {
        let v = mainSB.instantiateViewController(withIdentifier: "BottomUpMenuViewController")
        v.modalPresentationStyle = .overFullScreen
        self.present(v, animated: false, completion: nil)
    }
    
}

