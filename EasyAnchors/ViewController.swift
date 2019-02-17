//
//  ViewController.swift
//  EasyAnchors
//
//  Created by user140592 on 2/16/19.
//  Copyright © 2019 talspektor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let redView = UIView()
        redView.backgroundColor = .red
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        let purpleView = UIView()
        purpleView.backgroundColor = .purple
        
        [purpleView, redView, blueView, greenView].forEach { view.addSubview($0) }
        
        purpleView.fillSuperView()

        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                       leading: nil,
                       bottom: nil,
                       trailing: view.safeAreaLayoutGuide.trailingAnchor,
                       padding: .init(top: 0, left: 0, bottom: 0, right: 12),
                       size: .init(width: 125, height: 125
            ))
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        
        blueView.anchor(top: redView.bottomAnchor,
                        leading: nil,
                        bottom: nil,
                        trailing: redView.trailingAnchor,
                        padding: .init(top: 12, left: 0, bottom: 0, right: 0)
            )
        blueView.anchorSize(to: redView)
        
        greenView.anchor(top: redView.topAnchor,
                         leading: view.safeAreaLayoutGuide.leadingAnchor,
                         bottom: blueView.bottomAnchor,
                         trailing: redView.leadingAnchor,
                         padding: .init(top: 0, left: 12, bottom: 0, right: 12))
    
        
    }
    
    
}

extension UIView {
    
    func fillSuperView() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
        
    }
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
    
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading,constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
}



