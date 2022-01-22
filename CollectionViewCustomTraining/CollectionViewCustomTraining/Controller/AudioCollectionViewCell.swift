//
//  AudioCollectionViewCell.swift
//  CollectionViewCustomTraining
//
//  Created by Илья Игоревич  on 26.12.2021.
//

import Foundation
import UIKit

class AudioCollectionViewCell: UICollectionViewCell {
    
    static let identifire = "AudioCollectionView"
    
    let audioImageView: UIImageView = {
        let audioImageView = UIImageView()
        audioImageView.clipsToBounds = true
        audioImageView.contentMode = .scaleToFill
        audioImageView.layer.cornerRadius = 10
        audioImageView.backgroundColor = .white
        return audioImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(audioImageView)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        audioImageView.frame = contentView.bounds
    }
}
