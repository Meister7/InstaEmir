import Foundation
import UIKit
import SnapKit

class MainController: UIViewController {
    
    private lazy var feedCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(FeedCell.self, forCellWithReuseIdentifier: "FeedCell")
        view.register(StoriesCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "StoriesCollectionViewCell")
        return view
    }()
    
    private var profileArray: [InstaModel] = [
        InstaModel(name: "Captain America", postImage: "postCaptain", profileImage: "profileCaptain"),
        InstaModel(name: "Spider-Man", postImage: "postSpiderMan", profileImage: "profileSpiderMan"),
        InstaModel(name: "Doctor Strange", postImage: "postDoctor", profileImage: "profileDoctor"),
        InstaModel(name: "Black Panther", postImage: "postPanther", profileImage: "profilePanther"),
        InstaModel(name: "Thor", postImage: "postThor", profileImage: "profileThor"),
        InstaModel(name: "Hulk", postImage: "postHulk", profileImage: "profileHulk"),
    ]
    
    private lazy var instaLogo: UIImageView = {
        let view = UIImageView()
        view.image = .init(named: "instaLogo")
        return view
        
    }()
    
    private lazy var direct: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named:  "direct"), for: .normal)
        return view
    }()
    
    private lazy var toolBar: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var HomeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "house"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    private lazy var searchButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    private lazy var plusButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "plus.app"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    private lazy var likeButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    private lazy var profileButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "person", compatibleWith: .none), for: .normal)
        view.tintColor = .black
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(feedCollectionView)
        feedCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.addSubview(instaLogo)
        instaLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview()
            make.height.equalTo(view.frame.height / 10)
            make.width.equalTo(view.frame.width / 2)
        }
        
        view.addSubview(direct)
        direct.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(view.frame.height / 16)
            make.width.equalTo(view.frame.height / 16)
        }
        
        view.addSubview(toolBar)
        toolBar.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.height.equalTo(view.frame.height / 10)
            make.width.equalToSuperview()
            make.top.equalTo(feedCollectionView.snp.bottom)
        }
        toolBar.addArrangedSubview(HomeButton)
        toolBar.addArrangedSubview(searchButton)
        toolBar.addArrangedSubview(plusButton)
        toolBar.addArrangedSubview(likeButton)
        toolBar.addArrangedSubview(profileButton)
    }
}

extension MainController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profileArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as! FeedCell
        let model = profileArray[indexPath.row]
        cell.fill(model: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as! StoriesCollectionViewCell
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.width / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

