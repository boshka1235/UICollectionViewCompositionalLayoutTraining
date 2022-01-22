//
//  PlayerVC.swift
//  CollectionViewCustomTraining
//
//  Created by Илья Игоревич  on 27.12.2021.
//

import Foundation
import UIKit

class PlayerVC: UIViewController {
    
    private lazy var audioPickView: UIView = {
        let audioPickView = UIView()
        
        audioPickView.backgroundColor = .white
        audioPickView.layer.cornerRadius = 20
        
        return audioPickView
    }()
    
//    private lazy var playButton: UIButton = {
        let playButton = UIButton()
        
//        playButton.backgroundColor = .white
//        playButton.clipsToBounds = true
//        playButton.layer.cornerRadius = playButton.layer.frame.width/2
//
//        return playButton
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.07, green: 0.45, blue: 0.87, alpha: 1.00)
        
        anchorHelper(label: audioPickView, parentLabel: self.view, topAnchorLabel: self.view.topAnchor, bottomAnchorLabel: self.view.bottomAnchor, leadingAnchorLabel: self.view.leadingAnchor, trailingAnchorLabel: self.view.trailingAnchor, topAnchor: 170, leadingConstant: 60, trailingConstant: -60, widthConstant: nil, heightConstant: nil, bottomAnchor: -440)
        
        playButton.frame = CGRect(x: 170, y: 630, width: 85, height: 85)
        playButton.backgroundColor = .white
        playButton.layer.cornerRadius = playButton.layer.frame.size.width/2
        playButton.clipsToBounds = true
        view.addSubview(playButton)
        
//        anchorHelper(label: playButton, parentLabel: self.view, topAnchorLabel: self.view.topAnchor, bottomAnchorLabel: self.view.bottomAnchor, leadingAnchorLabel: self.view.centerXAnchor, trailingAnchorLabel: nil, topAnchor: 590, leadingConstant: -35, trailingConstant: nil, widthConstant: 70, heightConstant: 70, bottomAnchor: nil)
        
    }
}
