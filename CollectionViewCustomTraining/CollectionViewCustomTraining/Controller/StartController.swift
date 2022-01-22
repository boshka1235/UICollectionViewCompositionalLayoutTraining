//
//  StartController.swift
//  CollectionViewCustomTraining
//
//  Created by Илья Игоревич  on 25.12.2021.
//

import Foundation
import UIKit

class StartController: UIViewController {
    
    private let musicImages = [
                                "Image1",
                                "Image2",
                                "Image3",
                                "Image4",
                                "Image5",
                                "Image6"
                              ]
    
    private let labelText = [
                                "Рок",
                                "Иностранный рэп",
                                "Иностранный поп",
                                "Вечеринка в стиле фанк",
                                "Русский рэп",
                                "Русская альтернатива"
                            ]
    
    private let audioCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: StartController.createLayout()
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//         let navVC = UINavigationController()
        
        view.addSubview(audioCollectionView)
        audioCollectionView.register(AudioCollectionViewCell.self, forCellWithReuseIdentifier: AudioCollectionViewCell.identifire)
        audioCollectionView.frame = view.bounds
        audioCollectionView.backgroundColor = UIColor(red: 0.05, green: 0.00, blue: 0.15, alpha: 1.00)
        audioCollectionView.dataSource = self
        audioCollectionView.delegate = self
    }

    static func createLayout() -> UICollectionViewCompositionalLayout {

        let firstVerticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.23))
        )

        firstVerticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5)

        let secondVerticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.325))
        )

        secondVerticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5)

        let thirdVerticalStackItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.325))
        )

        thirdVerticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5)
        
        let verticalStackGroup1 = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1)),
            subitems: [
                thirdVerticalStackItem,
                secondVerticalStackItem,
                firstVerticalStackItem
            ]
        )

        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1)),
            subitems: [
                firstVerticalStackItem,
                secondVerticalStackItem,
                thirdVerticalStackItem
            ]
        )

        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1)),
            subitems: [
                verticalStackGroup1,
                verticalStackGroup
            ]
        )

        let section = NSCollectionLayoutSection(group: group)

        return UICollectionViewCompositionalLayout(section: section)
    }

}

extension StartController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = audioCollectionView.dequeueReusableCell(withReuseIdentifier: AudioCollectionViewCell.identifire, for: indexPath) as! AudioCollectionViewCell
        
        let titleLabel = UILabel()
        titleLabel.text = "Подборка"
        titleLabel.textColor = .white
        titleLabel.font = .boldSystemFont(ofSize: 16)
        anchorHelper(label: titleLabel, parentLabel: cell.audioImageView, topAnchorLabel: cell.audioImageView.topAnchor, bottomAnchorLabel: cell.audioImageView.bottomAnchor, leadingAnchorLabel: cell.audioImageView.leadingAnchor, trailingAnchorLabel: cell.audioImageView.trailingAnchor, topAnchor: nil, leadingConstant: 10, trailingConstant: nil, widthConstant: 100, heightConstant: nil, bottomAnchor: -10)
        
        let musicLabel = UILabel()
        musicLabel.text = labelText[indexPath.row]
        musicLabel.textColor = .white
        musicLabel.lineBreakMode = .byWordWrapping
        musicLabel.numberOfLines = 0
        musicLabel.font = .boldSystemFont(ofSize: 18)
        anchorHelper(label: musicLabel, parentLabel: cell.audioImageView, topAnchorLabel: cell.audioImageView.topAnchor, bottomAnchorLabel: cell.audioImageView.bottomAnchor, leadingAnchorLabel: cell.audioImageView.leadingAnchor, trailingAnchorLabel: cell.audioImageView.trailingAnchor, topAnchor: nil, leadingConstant: 10, trailingConstant: nil, widthConstant: 150, heightConstant: nil, bottomAnchor: -30)
        
        cell.audioImageView.image = UIImage(named: musicImages[indexPath.row])
        cell.audioImageView.alpha = 0.9
        cell.contentView.backgroundColor = .white
        cell.contentView.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("Tap1")
            let playerVC = PlayerVC()
            playerVC.modalPresentationStyle = .custom
//            playerVC.transitioningDelegate = bottomSheetTransitioningDelegate
            self.present(playerVC, animated: true, completion: nil)
//            self.navigationController?.pushViewController(playerVC, animated: true)
        }
    }
    
}


