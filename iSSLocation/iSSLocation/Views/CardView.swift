//
//  CrewView.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 6/6/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import SnapKit
import Combine

final class CardView: UIView {
    
    var gestureValue =  PassthroughSubject<CGFloat, Never>()
    
    private let profileImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Doug_Hurley.jpg"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let infoLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 10
        label.textColor = UIColor(named: "text-color")
        
        //MARK: demo info
        let contentAttribute = NSMutableAttributedString(string: "Doug Hurley", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .bold)])
        
        let spaceMisssionAttribute = NSAttributedString(string: "\n\nCrew Dragon Demo-2, STS-135, STS-127", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .light)])
        
        
        let agencyMisssionAttribute = NSAttributedString(string: "\nNASA", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .medium)])
        
        contentAttribute.append(spaceMisssionAttribute)
        contentAttribute.append(agencyMisssionAttribute)
        
        label.attributedText = contentAttribute
        
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Add subviews
        addSubview(profileImage)
        addSubview(infoLabel)
        
        //Backgound view
        backgroundColor = UIColor(named: "crew-card-bg")
        layer.cornerRadius = 10
       
    
        //Setup constains
        setupConstrains()
        
        profileImage.layer.cornerRadius = 60
        profileImage.clipsToBounds = true
  
        //pan gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        
        
        addGestureRecognizer(panGesture)
        addGestureRecognizer(tapGesture)
      
    }

    
    /// Setup constains view after adding subviews
    private func setupConstrains(){
        
        profileImage.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().inset(10)

            make.height.width.equalTo(120)
            
         }

         infoLabel.snp.makeConstraints { (make) in
             make.left.equalTo(profileImage.snp.right).offset(20)
             make.right.equalToSuperview().inset(10)
             make.top.equalToSuperview().inset(20)
         }
    }
    
    /// Handle cart gesture movements
    /// - Parameter gesture: UIPanGestureRecognizer
    @objc private func handlePanGesture(_ gesture : UIPanGestureRecognizer) {
        let gestureX = gesture.translation(in: nil ).x
        frame.origin.x = gestureX
        self.gestureValue.send(frame.origin.x)
        if gesture.state == .ended {
           
            if abs(frame.origin.x) < superview!.frame.width / 2 {
                UIView.animate(withDuration: 0.2, delay: 0,usingSpringWithDamping: 2, initialSpringVelocity: 5, options: .curveEaseInOut,
                               animations: {
                                self.frame.origin.x = 0
                                self.gestureValue.send(0)
                }) { (_ ) in
                    
                }
            } else {
               
                UIView.animate(withDuration: 0.1, animations: {
                    self.frame.origin.x = (gestureX>0) ? self.superview!.frame.width + 100 : -(self.superview!.frame.width + 50)
                }) { (_ ) in
                    let generator = UIImpactFeedbackGenerator(style: .soft)
                    generator.impactOccurred()
                }
            }
        }
    
    }
    
    @objc private func handleTapGesture (_ gesture: UITapGestureRecognizer){
        
        UIApplication.shared.windows.first?.rootViewController!.present(DetailCardViewController(), animated: true, completion: nil)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
