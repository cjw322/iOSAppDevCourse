//
//  NavViewController.swift
//  cjw322_p4
//
//  Created by Cora Wu on 10/28/18.
//  Copyright © 2018 Cora Wu. All rights reserved.
//

import UIKit

class NavViewController: UIViewController {
    
    var songTitleText: UITextView!
    var songArtistText: UITextView!
    var songAlbumText: UITextView!
    var song: Song!
    
    weak var delegate: ChangeSongInfoDelegate?
    weak var delegate2: Song?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Change Song"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonWasTapped))
        
        songTitleText = UITextView()
        songTitleText.translatesAutoresizingMaskIntoConstraints = false
        songTitleText.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        if let song = delegate2 {
            songTitleText.text = song.songName
        }
        songTitleText.textColor = .black
        songTitleText.backgroundColor = .white
        songTitleText.isEditable = true
        view.addSubview(songTitleText)
        
        songArtistText = UITextView()
        songArtistText.translatesAutoresizingMaskIntoConstraints = false
        songArtistText.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        if let song = delegate2{
            songArtistText.text = song.artistName
        }
        songArtistText.textColor = .black
        songArtistText.backgroundColor = .white
        songArtistText.isEditable = true
        view.addSubview(songArtistText)
        
        songAlbumText = UITextView()
        songAlbumText.translatesAutoresizingMaskIntoConstraints = false
        songAlbumText.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        if let song = delegate2 {
            songAlbumText.text = song.albumName
        }
        songAlbumText.textColor = .black
        songAlbumText.backgroundColor = .white
        songAlbumText.isEditable = true
        view.addSubview(songAlbumText)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            songTitleText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            songTitleText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            songTitleText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            songTitleText.heightAnchor.constraint(equalToConstant: 100)
            ])
        NSLayoutConstraint.activate([
            songArtistText.topAnchor.constraint(equalTo: songTitleText.bottomAnchor, constant: 20),
            songArtistText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            songArtistText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            songArtistText.heightAnchor.constraint(equalToConstant: 100)
            ])
        NSLayoutConstraint.activate([
            songAlbumText.topAnchor.constraint(equalTo: songArtistText.bottomAnchor, constant: 20),
            songAlbumText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            songAlbumText.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            songAlbumText.heightAnchor.constraint(equalToConstant: 100)
            ])
        
    }
    
    @objc func saveButtonWasTapped() {
        let titleText = songTitleText.text
        let artistText = songArtistText.text
        let albumText = songAlbumText.text
        
        if let actualTitleText = titleText, let actualArtistText = artistText, let actualAlbumText = albumText, actualTitleText != "", actualArtistText != "", actualAlbumText != "" {
            delegate?.changeSongInfo(songTitle: actualTitleText, songArtist: actualArtistText, songAlbum: actualAlbumText)
            song.songName = actualTitleText
            song.artistName = actualArtistText
            song.albumName = actualAlbumText
//            songTitleText.text = actualTitleText
//            songText = actualTitleText
            self.navigationController?.popViewController(animated: true)
        } else if let actualText = titleText, actualText == "" {
            let alert = UIAlertController(title: "ALERT", message: "Please input a title.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion:nil)
        }
    }

}
