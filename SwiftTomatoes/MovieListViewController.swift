//
//  MovieListViewController.swift
//  SwiftTomatoes
//
//  Created by Michael Emery on 6/11/14.
//  Copyright (c) 2014 Michael Emery. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var movieList = MovieList()
    let operationQueue = NSOperationQueue();
    @IBOutlet var movieListTableView : UITableView

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        println("lousy piece of junk")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        var customNib = UINib(nibName: "MovieEntryTableViewCell", bundle: nil)
        self.movieListTableView.registerNib(customNib, forCellReuseIdentifier: "foo")

        println("loaded");
        self.loadMoviesFromNetwork()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows =  self.movieList.size()

        return rows
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath: NSIndexPath?) {
        let movie = self.movieList.get(didSelectRowAtIndexPath!.item)
        let movieDetail = MovieDetailViewController(movie: movie)

        self.navigationController.pushViewController(movieDetail, animated: true)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("foo", forIndexPath: indexPath) as MovieEntryTableViewCell

        let movie = movieList.get(indexPath.item)
        cell.titleLabelView.text = movie.title
        cell.thumnailUrl = movie.thumbnailUrl

        return cell;
    }

    func loadMoviesFromNetwork() {

        let url = "http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey="

        let request = NSURLRequest(URL: NSURL(string: url))

        NSURLConnection.sendAsynchronousRequest(request, queue: self.operationQueue, completionHandler: {(response, data, error) in
            self.movieList = MovieList(jsonData: data)

            dispatch_async(dispatch_get_main_queue(), {
                self.movieListTableView.reloadData()
            })
            println("I kill you scum")
        });
    }
}
