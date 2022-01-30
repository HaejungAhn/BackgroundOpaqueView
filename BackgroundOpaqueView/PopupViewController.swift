//
//  PopupViewController.swift
//  BackgroundOpaqueView
//
//  Created by WAI on 2022/01/30.
//

import UIKit

class PopupViewController: UIViewController {
    
    @IBOutlet weak var container: UIStackView!
    @IBOutlet weak var additionalLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    private let backView = BackgroundOpaqueView(useAutoLayout: false)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // backView 설정
        view.insertSubview(backView, at: 0)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(confirmButtonTapped(_:)))
        backView.addGestureRecognizer(gesture)
        
        
        container.layer.cornerRadius = 8
        container.clipsToBounds = true
        container.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)
        container.isLayoutMarginsRelativeArrangement = true
        
        titleLabel.text = "알림"
        descLabel.text = "팝업창을 닫으시겠습니까? \n\n닫기를 원하시는 경우 확인 버튼을 누르시거나 배경을 눌러주세요."
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        backView.toggle(isHidden: false)
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        backView.toggle(isHidden: true, hideViews: [container, additionalLabel], completion: {
            self.dismiss(animated: false)
        })
    }
    
}

