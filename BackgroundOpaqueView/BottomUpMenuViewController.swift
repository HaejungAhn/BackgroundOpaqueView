//
//  BottomUpMenuViewController.swift
//  BackgroundOpaqueView
//
//  Created by WAI on 2022/01/30.
//

import UIKit

class BottomUpMenuViewController: UIViewController {
    
    
    @IBOutlet weak var container: UIView!
    private let backView = BackgroundOpaqueView(useAutoLayout: true)
    private let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // backView 설정
        view.insertSubview(backView, at: 0)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeVC))
        backView.addGestureRecognizer(gesture)
        
        
        container.isHidden = true
        container.layer.cornerRadius = 20
        container.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        container.clipsToBounds = true

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        container.frame.origin.y = screenHeight
        let y = screenHeight - self.container.frame.height - self.view.safeAreaInsets.bottom
        
        backView.toggle(isMovingToHide: false, y: y, moveView: container)
    }
    
    @objc func closeVC() {
        backView.toggle(isMovingToHide: true, y: screenHeight, moveView: container, completion: {
            self.dismiss(animated: false)
        })
    }
    
    
}
