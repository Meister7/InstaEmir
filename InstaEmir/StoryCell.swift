//
//  StoryCell.swift
//  InstaEmir
//
//  Created by Эмир Кармышев on 18/2/22.
//

import Foundation
import UIKit
import SnapKit

class StoryCell: UICollectionViewCell{
    
    private lazy var profileImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var profileLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 10, weight: .semibold)
        return view
    }()
    
    override func layoutSubviews() {
        addSubview(profileImage)
        profileImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalTo(frame.width / 1.5)
        }
        addSubview(profileLabel)
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    func fill(model: InstaModel){
        self.profileImage.image = UIImage(named: model.profileImage!)
        self.profileLabel.text = model.name!
    }
    
}
