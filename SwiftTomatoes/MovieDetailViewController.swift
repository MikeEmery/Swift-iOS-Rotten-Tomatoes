//
//  MovieDetailViewController.swift
//  SwiftTomatoes
//
//  Created by Michael Emery on 6/11/14.
//  Copyright (c) 2014 Michael Emery. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet var largePosterImageView : UIImageView
    @IBOutlet var synopsisTextView : UITextView
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie;
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Movie: \(self.movie.title)")
        self.title = self.movie.title
        self.synopsisTextView.text = self.movie.synopsis
        
        let request = NSURLRequest(URL: movie.largeUrl)
        let operationQueue = NSOperationQueue()
        
        NSURLConnection.sendAsynchronousRequest(request, queue: operationQueue, completionHandler: {(response, data, error) in
            let downloadedImage = UIImage(data: data)
            
            dispatch_async(dispatch_get_main_queue(), {
                self.largePosterImageView.image = downloadedImage
            })
            
            println("downloaded large image")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
