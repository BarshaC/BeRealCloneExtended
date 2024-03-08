//
//  PostCell.swift
//  BeReal
//
//  Created by Barsha Chaudhary on 3/3/24.
//

import UIKit
import Alamofire
import AlamofireImage

class PostCell: UITableViewCell {

//    @IBOutlet weak var usernameLabel: UILabel!
//    @IBOutlet weak var dateLabel: UILabel!
//    @IBOutlet weak var captionLabel: UILabel!
//
//    
//    @IBOutlet weak var feedImage: UIImageView!
    
    @IBOutlet weak var postFeedImagePreview: UIImageView!
    @IBOutlet weak var usernameLabelField: UILabel!
    private var imageDataRequest: DataRequest?
    @IBOutlet weak var captionFieldLabel: UILabel!
    
    @IBOutlet weak var dateLabelCaption: UILabel!
    func configure(with post: Post) {
        // Username
        if let user = post.user {
            usernameLabelField.text = user.username
        }

        // Image
        if let imageFile = post.imageFile, let imageUrl = imageFile.url {
            // Use AlamofireImage helper to fetch remote image from URL
            imageDataRequest = AF.request(imageUrl).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    // Set image view image with fetched image
                    print("IMAGE PRINTED!")
                    print(imageUrl)
                    self?.postFeedImagePreview.image = image
                case .failure(let error):
                    print("❌ Error fetching image: \(error.localizedDescription)")
                    // You can also print the full error for more details
                    print("Full error: \(error)")
                }
            }
        }

        // Caption
        captionFieldLabel.text = post.caption

        // Date
        if let date = post.createdAt {
            dateLabelCaption.text = DateFormatter.postFormatter.string(from: date)
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //Cancel image download
        postFeedImagePreview.image = nil

        // Cancel image request.
        imageDataRequest?.cancel()

    }


}
