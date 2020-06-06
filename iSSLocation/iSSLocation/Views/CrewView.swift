//
//  CrewView.swift
//  iSSLocation
//
//  Created by Aminjoni Abdullozoda on 6/6/20.
//  Copyright © 2020 Aminjoni Abdullozoda. All rights reserved.
//

import UIKit
import SnapKit

final class CrewView: UIView {
    
    private let profileImage : UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Doug_Hurley.jpg"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let infoLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 10
        
        
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
        
        //Backgound view
        backgroundColor = .white
        layer.cornerRadius = 15
        clipsToBounds = true

    }
    
    
    
    /// Setup constains view after adding subviews
    private func setupConstrains(){
        
        profileImage.snp.makeConstraints { (make) in
             make.left.bottom.top.equalToSuperview()
             make.width.equalTo(130)
         }
        
         infoLabel.snp.makeConstraints { (make) in
             make.left.equalTo(profileImage.snp.right).offset(20)
             make.right.equalToSuperview().inset(10)
             make.top.equalToSuperview().inset(20)
         }
    }
    
    
    
    
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
