//
//  StoryTableViewCell.swift
//  Catstagram
//
//  Created by 이주송 on 2022/04/07.
// aaaa

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
    @IBOutlet weak var collectionView: UICollectionView!
    
    func setCollectionViewDataSourceDelegate(dataSourceDelegate: UICollectionViewDelegate & UICollectionViewDataSource, forRow row : Int)
    {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        
        let storyNib = UINib(nibName: "StoryCollectionViewCell", bundle: nil)
        collectionView.register(storyNib, forCellWithReuseIdentifier: "StoryCollectionViewCell")
                
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left:20, bottom:0, right: 20)
        flowLayout.minimumLineSpacing = 12

        collectionView.collectionViewLayout = flowLayout
        collectionView.reloadData()
        
    } // 이 setCollectionViewDataSourceDelegate( ) 을 HomeViewController 에서 쓰겠다 !
    

    
}
