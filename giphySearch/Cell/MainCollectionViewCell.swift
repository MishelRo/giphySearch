//
//  MainCollectionViewCell.swift
//  giphySearch
//
//  Created by User on 13.09.2021.
//

import UIKit
import SnapKit
import GiphyUISDK
class MainCollectionViewCell: UICollectionViewCell,
                              GPHMediaViewDelegate,
                              GPHVideoViewDelegate {
    
    static var id = "Cell"
    static var name = "MainCollectionViewCell"
    
    var mediaView: GPHMediaView!

    func didPressMoreByUser(_ user: String) {
        print("hello")
    }
    
    private func conf(media: GPHMedia) {
        layer.cornerRadius = 40
        let mediaView = GPHMediaView()
        mediaView.media = media
        mediaView.delegate = self
    self.addSubview(mediaView)
        mediaView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).inset(5)
            make.left.equalTo(self.snp.left).inset(5)
            make.height.equalTo(self.snp.height)
            make.width.equalTo(self.snp.width)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func cellConfigure(gphMedia: GPHMedia) {
        conf(media: gphMedia)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
