//
//  MovieEntryTableViewCell.swift
//  SwiftTomatoes
//
//  Created by Michael Emery on 6/12/14.
//  Copyright (c) 2014 Michael Emery. All rights reserved.
//

import UIKit

var downloadQueue : NSOperationQueue = NSOperationQueue()

class MovieEntryTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabelView : UILabel
    @IBOutlet var thumbnailImageView : UIImageView
    
    var thumnailUrl : NSURL? {
        didSet(value) {
            loadThumbnailUrl()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.imageView.autoresizingMask = .None
        self.imageView.contentMode = .ScaleAspectFill
        self.imageView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadThumbnailUrl() {
        let request = NSURLRequest(URL: self.thumnailUrl)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: downloadQueue, completionHandler: {(response, data, error) in
            let image = UIImage(data: data)
            self.thumbnailImageView.image = image
        })
    }
}
