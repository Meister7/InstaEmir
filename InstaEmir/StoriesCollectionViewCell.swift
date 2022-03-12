import Foundation
import UIKit
import SnapKit

class StoriesCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private var storiesArray: [InstaModel] = [
        InstaModel(name: "Captain America",profileImage: "profileCaptain"),
        InstaModel(name: "Spider-Man",profileImage: "profileSpiderMan"),
        InstaModel(name: "Doctor Strange",profileImage: "profileDoctor"),
        InstaModel(name: "Black Panther",profileImage: "profilePanther"),
        InstaModel(name: "Thor",profileImage: "profileThor"),
        InstaModel(name: "Hulk",profileImage: "profileHulk"),
    ]
    
    let storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        setupCollectionView()
        setupSubViews()
    }
    
    private func setupCollectionView() {
    storyCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
    }
    
    private func setupSubViews(){
        addSubview(storyCollectionView)
        storyCollectionView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storiesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
        let model = storiesArray[indexPath.row]
        cell.fill(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.height - 10, height: frame.height - 10)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

