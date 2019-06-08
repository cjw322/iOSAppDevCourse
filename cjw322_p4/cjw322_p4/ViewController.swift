//
//  ViewController.swift
//  cjw322_p4
//
//  Created by Cora Wu on 10/28/18.
//  Copyright © 2018 Cora Wu. All rights reserved.
//

import UIKit

var songText = ""
//var song = Song(songName: "", artistName: "", albumName: "")

protocol ChangeSongInfoDelegate: class {
    func changeSongInfo(songTitle: String, songArtist: String, songAlbum: String)
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    var songTitleButton: UIButton!
    var tableView: UITableView!
    var songs: [Song]!
    var song = Song(songName: "", artistName: "", albumName: "")
    
    let reuseIdentifier = "songCellReuse"
    let cellHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Songs"
        view.backgroundColor = .white
        
        let dinosaur = Song(songName: "DINOSAUR", artistName: "Akdong Musician", albumName: "Summer Episode")
        let goodLife = Song(songName: "Good Life", artistName: "One Republic", albumName: "Waking Up")
        let hiHello = Song(songName: "Hi Hello", artistName: "DAY6", albumName: "Every DAY6 July")
        let inMyBlood = Song(songName: "In My Blood", artistName: "Shawn Mendes", albumName: "Shawn Mendes")
        let liftedUp = Song(songName: "Lifted Up (1985)", artistName: "Passion Pit", albumName: "Kindred")
        let nanana = Song(songName: "NANANA", artistName: "IMFACT", albumName: "NANANA")
        let neverBeTheSame = Song(songName: "Never Be the Same", artistName: "Camila Cabello", albumName: "Camila")
        let theOcean = Song(songName: "The Ocean", artistName: "Mike Perry", albumName: "The Ocean")
        let photograph = Song(songName: "Photograph", artistName: "Ed Sheeran", albumName: "X")
        let turningOut = Song(songName: "Turning Out", artistName: "AJR", albumName: "The Click")
        songs = [dinosaur, goodLife, hiHello, inMyBlood, liftedUp, nanana, neverBeTheSame, theOcean, photograph, turningOut]
        
        // Initialize tableView
        tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        //        bc viewController is an instance of UITableViewDelegate and UITableViewDataSource need to ensure and create functions to create tableView??
        tableView.register(SongTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    // MARK: - UITableViewDataSource methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SongTableViewCell
        song = songs[indexPath.row]
        //        how we're getting each row of the tableView cell
        cell.configure(for: song)
        //        each cell is an object of an instance of this song class
        //        configure method defined in CafeteriaTableView - sets nameLabel and ratingLabel
        cell.setNeedsUpdateConstraints()
        //        calling already updated constraints we configured
        //        each cell has auto layout guide that's diff from original UITableView
        cell.selectionStyle = .none
        
        return cell
        //        have to return cell so it knows we're actually returning a cell within the tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
        //        figure out how many rows we're creating
    }
    
    // MARK: - UITableViewDelegate methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //        delegate - handles everything that happens when you interact with the tableView cell
        
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        didSelectRowAt for when row is tapped on
        let cell = tableView.cellForRow(at: indexPath) as! SongTableViewCell // takes index of cell within list of songs
        let song = songs[indexPath.row]
        //        instantiating song from list of song objects with indexPath at the row you're at
        let songViewController = NavViewController()
        songViewController.song = song
        songViewController.delegate = self
        songViewController.delegate2 = song
        navigationController?.pushViewController(songViewController, animated: true)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension ViewController: ChangeSongInfoDelegate {
    
    func changeSongInfo(songTitle: String, songArtist: String, songAlbum: String){
        song.songName = songTitle
        song.artistName = songArtist
        song.albumName = songAlbum
        tableView.reloadData()

    }
}

