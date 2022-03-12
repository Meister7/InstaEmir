import UIKit
import SnapKit

class FeedCell: UICollectionViewCell{
    
    private lazy var postImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var profile1Image: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var profileLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .semibold)
        return view
    }()
    private lazy var action: UIButton = {
         let view = UIButton()
         view.setImage(UIImage(systemName:  "ellipsis"), for: .normal)
         view.tintColor = .black
         return view
     }()
     private lazy var touchPublicCell: UIStackView = {
         let view = UIStackView()
         view.axis = .horizontal
         view.distribution = .fillProportionally
         return view
     }()
     private lazy var likeButton: UIButton = {
         let view = UIButton()
         view.setImage(UIImage(systemName: "suit.heart"), for: .normal)
         view.tintColor = .black
         view.addTarget(self, action: #selector(clickLike(view:)), for: .touchUpInside)
         return view
     }()
     private lazy var messageButton: UIButton = {
         let view = UIButton()
         view.setImage(UIImage(systemName: "message"), for: .normal)
         view.tintColor = .black
         return view
     }()
     private lazy var shareButton: UIButton = {
         let view = UIButton()
         view.setImage(UIImage(systemName: "paperplane"), for: .normal)
         view.tintColor = .black
         return view
     }()
     private lazy var saveButton: UIButton = {
         let view = UIButton()
         view.setImage(UIImage(systemName: "bookmark"), for: .normal)
         view.tintColor = .black
         view.addTarget(self, action: #selector(clicsave(view:)), for: .touchUpInside)
         return view
     }()
     
     private lazy var likesLabel: UILabel = {
         let view = UILabel()
         view.text = "    like"
         view.font = .systemFont(ofSize: 10)
         view.textColor = .black
         return view
     }()
     
     
     @objc func clickLike(view: UIButton){
         var value = 0
         value = value + 1
       likesLabel.text = String("\(value) like")
         likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
         likeButton.tintColor = .red
         
     }
     @objc func clicsave(view: UIButton){
         saveButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
     }
     
    
    override func layoutSubviews() {
        addSubview(profile1Image)
        profile1Image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(frame.height / 12)
            make.width.equalTo(frame.height / 12)
        }
        addSubview(profileLabel)
        profileLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profile1Image)
            make.left.equalTo(profile1Image.snp.right).offset(10)
        }
        
        addSubview(postImage)
        postImage.snp.makeConstraints { make in
            make.top.equalTo(profile1Image.snp.bottom).offset(10)
            make.height.equalTo(frame.height / 1.5)
            make.width.equalToSuperview()
        }
        
        addSubview(action)
        action.snp.makeConstraints { make in
            make.centerY.equalTo(profile1Image)
            make.right.equalToSuperview()
            make.height.equalTo(frame.height / 12)
            make.width.equalTo(frame.height / 12)
        }
        
        addSubview(touchPublicCell)
        touchPublicCell.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp.bottom)
            make.left.equalToSuperview().offset(10)
            make.height.equalTo(frame.height / 10)
            make.width.equalTo(frame.width / 3.5 )
            make.bottom.equalToSuperview().offset(-10)
        }
        
        touchPublicCell.addArrangedSubview(likeButton)
        touchPublicCell.addArrangedSubview(messageButton)
        touchPublicCell.addArrangedSubview(shareButton)
        
        addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.height.equalTo(frame.height / 20)
            make.width.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview()
        }
        addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(postImage.snp.bottom)
            make.right.equalToSuperview()
            make.height.equalTo(frame.height / 10)
            make.width.equalTo(frame.width / 10)
        }
                    
    }
    
    func fill(model: InstaModel){
        self.postImage.image = UIImage(named: model.postImage!)
        self.profileLabel.text = model.name
        self.profile1Image.image = UIImage(named: model.profileImage!)
    }
    
}
