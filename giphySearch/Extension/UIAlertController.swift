//
//  UIAlertController.swift
//  giphySearch
//
//  Created by User on 13.09.2021.
//

import UIKit
extension UIAlertController {
    func getDelAlert(alertComplession: (UIAlertController)->(),
                     complession: @escaping()->()) {
        let alert = UIAlertController(title: "Delete?",
                                      message: "Delete this picture?",
                                      preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { _ in
            complession()
        }
        let cancel = UIAlertAction(title: "cancel",
                                   style: .destructive) { _ in
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        alertComplession(alert)
    }
}
