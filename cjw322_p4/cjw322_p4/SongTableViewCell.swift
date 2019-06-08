//
//  SongTableViewCell.swift
//  cjw322_p4
//
//  Created by Cora Wu on 10/28/18.
//  Copyright © 2018 Cora Wu. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    var songNameLabel: UILabel!
    var songArtistLabel: UILabel!
    var songAlbumLabel: UILabel!
    var songAlbumCover: UIImageView!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 16
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        reuseIdentifier to create each cell
        
        songNameLabel = UILabel()
        songNameLabel.translatesAutoresizingMaskIntoConstraints = false
        //        false bc using auto layout restraints?
        songNameLabel.font = UIFont.systemFont(ofSize: 14)
        //        styling option to use default system font
        
        songArtistLabel = UILabel()
        songArtistLabel.translatesAutoresizingMaskIntoConstraints = false
        songArtistLabel.font = UIFont.systemFont(ofSize: 12)
        
        songAlbumLabel = UILabel()
        songAlbumLabel.translatesAutoresizingMaskIntoConstraints = false
        songAlbumLabel.font = UIFont.systemFont(ofSize: 12)
        
        songAlbumCover = UIImageView()
        songAlbumCover.translatesAutoresizingMaskIntoConstraints = false
        songAlbumCover.clipsToBounds = true
        songAlbumCover.contentMode = .scaleAspectFit
        
        contentView.addSubview(songNameLabel)
        contentView.addSubview(songArtistLabel)
        contentView.addSubview(songAlbumLabel)
        contentView.addSubview(songAlbumCover)
        //        use contentView bc it's a cell, not the entire view
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            songAlbumCover.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            songNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            songNameLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            songAlbumCover.widthAnchor.constraint(equalToConstant: 50),
            songAlbumCover.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            songNameLabel.leadingAnchor.constraint(equalTo: songAlbumCover.trailingAnchor, constant: padding),
            songNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            songNameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        //        constraints for each label
        
        NSLayoutConstraint.activate([
            songArtistLabel.leadingAnchor.constraint(equalTo: songNameLabel.leadingAnchor),
            songArtistLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor),
            songArtistLabel.heightAnchor.constraint(equalTo: songNameLabel.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            songAlbumLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: padding * -1),
            songAlbumLabel.topAnchor.constraint(equalTo: songNameLabel.bottomAnchor),
            songAlbumLabel.heightAnchor.constraint(equalTo: songNameLabel.heightAnchor)
            ])
        super.updateConstraints()
        //        have to override this from the update constraints? so that all the cells will have the same format
    }
    
    //    configure each cell to have that data
    func configure(for song: Song) {
        songAlbumCover.image = UIImage(named: song.albumName)
        songNameLabel.text = song.songName
        songArtistLabel.text = song.artistName
        songAlbumLabel.text = song.albumName
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
