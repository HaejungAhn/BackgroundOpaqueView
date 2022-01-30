//
//  BackgroundOpaqueView.swift
//  BackgroundOpaqueView
//
//  Created by WAI on 2022/01/30.
//

import UIKit

class BackgroundOpaqueView: UIView {
    
    /// BackgroundOpaqueView의 색상
    /// setBackViewColor(backViewColor: UIColor, opacity: CGFloat) 메소드를 통해 value 변경
    private var backViewColor: UIColor = .black
    
    /// BackgroundOpaqueView의 투명도
    /// setBackViewColor(backViewColor: UIColor, opacity: CGFloat) 메소드를 통해 value 변경
    private var opacity: CGFloat = 0.7
    
    /// BackgroundOpaqueView의 show / hide animation의 duration
    /// setAnimationDuration(duration: CGFloat) 메소드를 통해 value 변경
    private var animationDuration: CGFloat = 0.2
    
    /// useAutoLayout: Bool
    /// true -> Auto layout을 이용해 BackgroundOpaqueView의 레이아웃을 잡는 경우
    ///      해당 view의 translatesAutoresizingMaskIntoConstraints을 활성화
    /// false -> BackgroundOpaqueView의 frame 사이즈를 디바이스 스크린 사이즈와 동일하게 만듬
    init(useAutoLayout: Bool) {
        super.init(frame: .zero)
        commonInit(useAutoLayout: useAutoLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(useAutoLayout: Bool) {
        self.backgroundColor = .clear
        self.isUserInteractionEnabled = true
        
        if useAutoLayout {
            self.translatesAutoresizingMaskIntoConstraints = false
        } else {
            if frame == .zero {
                frame = UIScreen.main.bounds
            }
        }
    }
    
    func setBackViewColor(backViewColor: UIColor, opacity: CGFloat) {
        self.backViewColor = backViewColor
        self.opacity = opacity
    }
    
    func setAnimationDuration(duration: CGFloat) {
        self.animationDuration = duration
    }
    
    /// BackgroundOpaqueView가 팝업창의 배경뷰로써 사용되는 경우 아래 메소드를 호출하여 배경뷰의 show / hide를 처리한다.
    func toggle(isHidden: Bool, hideViews: [UIView?]? = nil, completion: (() -> Void)? = nil) {
        if isHidden {
            UIView.animate(withDuration: animationDuration, delay:0, options: .curveEaseIn, animations: {
                hideViews?.forEach { $0?.isHidden = true }
                self.backgroundColor = .clear
            }, completion: { _ in
                completion?()
            })
        } else {
            UIView.animate(withDuration: animationDuration, delay:0, options: .curveEaseIn, animations: {
                self.backgroundColor = self.backViewColor.withAlphaComponent(self.opacity)
            }, completion: { _ in
                completion?()
            })
        }
    }
    
    /// BackgroundOpaqueView가 바텀업 메뉴의 배경뷰로써 사용되는 경우 아래 메소드를 호출하여 배경뷰의 show / hide를 처리한다.
    func toggle(isMovingToHide: Bool, y: CGFloat, moveView: UIView? = nil, completion: (() -> Void)? = nil) {
        if isMovingToHide {
            UIView.animate(withDuration: animationDuration, delay:0, options: .curveEaseIn, animations: {
                moveView?.frame.origin.y = y
                self.backgroundColor = .clear
            }, completion: { _ in
                completion?()
            })
        } else {
            UIView.animate(withDuration: animationDuration, delay:0, options: .curveEaseIn, animations: {
                self.backgroundColor = self.backViewColor.withAlphaComponent(self.opacity)
                moveView?.isHidden = false
                moveView?.frame.origin.y = y
            }, completion: { _ in
                completion?()
            })
        }
    }
}
