//
//  MainViewController.swift
//  giphySearch
//
//  Created by User on 13.09.2021.
//

import UIKit
import GiphyUISDK

class MainViewController: UIViewController, GiphyDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var controller = GiphyViewController()
    var model: MainModelViewController! {
        return MainModelViewController()
    }
    
    @objc func add() {
        present(controller, animated: true, completion: nil)
    }
    
    @objc func doubleTab(swipe: UISwipeGestureRecognizer) {
        if (swipe.state != UIGestureRecognizer.State.ended){
            return
        }
        
        let p = swipe.location(in: self.collectionView)
        
        if let IndexPath = (self.collectionView?.indexPathForItem(at: p)) {
            UIAlertController().getDelAlert { [unowned self] controller in
                present(controller, animated: true, completion: nil)
            } complession: {
                MainModelViewController.arrayOfGif.remove(at: IndexPath.row)
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        controller.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.9399991632, green: 0.9031837583, blue: 0.978277266, alpha: 1)
        collectionView.register(UINib(nibName: MainCollectionViewCell.name, bundle: nil),
                                forCellWithReuseIdentifier: MainCollectionViewCell.id)
        add()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(add))
        let doubleTap = UISwipeGestureRecognizer(target: self, action: #selector(doubleTab))
        collectionView.addGestureRecognizer(doubleTap)
    }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        MainModelViewController.arrayOfGif.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.id,
                                                      for: indexPath) as! MainCollectionViewCell
        cell.cellConfigure(gphMedia: MainModelViewController.arrayOfGif[indexPath.row])
        return cell
    }
    
    func didDismiss(controller: GiphyViewController?) {
        dismiss(animated: true, completion: nil)
    }
}

extension MainViewController {
    func didSelectMedia(giphyViewController: GiphyViewController,
                        media: GPHMedia) {
        MainModelViewController.arrayOfGif.append(media)
        print(MainModelViewController.arrayOfGif.count)
        collectionView.reloadData()
        giphyViewController.dismiss(animated: true, completion: nil)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView
                        , layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize().autoSize(countOf: 1, view: view)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constants.layautEdge
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Constants.lineSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(Constants.lineSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let shared = MainModelViewController.arrayOfGif[indexPath.row]
        let share =  UIActivityViewController(activityItems: [shared.url],
                                              applicationActivities: nil)
        present(share, animated: true, completion: nil)
    }
}
