import Foundation
import UIKit

class InstaModel{
    var name: String? = nil
    var postImage: String? = nil
    var profileImage: String? = nil
    
    init(name: String, postImage: String, profileImage: String){
        self.name = name
        self.postImage = postImage
        self.profileImage = profileImage
    }
    
    init(name: String,profileImage: String){
        self.name = name
        self.profileImage = profileImage
    }
    
}
