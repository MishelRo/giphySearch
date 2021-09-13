//
//  CGSize.swift
//  giphySearch
//
//  Created by User on 13.09.2021.
//

import Foundation
import UIKit
extension CGSize{
    func autoSize(countOf elements: Int, view: UIView) -> CGSize{
        let a: CGFloat = CGFloat(elements)
        let b = 20 * (a + 1)
        let c = view.frame.width - b
        let d = c / a
        return CGSize(width: d, height: d - b * 2)
    }
}
