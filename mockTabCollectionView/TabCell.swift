//
//  TabCell.swift
//  mockTabCollectionView
//
//  Created by mzgk on 2016/11/08.
//  Copyright © 2016年 mzgk. All rights reserved.
//

import UIKit

protocol TabCellDelegate {
    // Tabを閉じるデリゲートメソッド
    func tabClose(button: UIButton)
}

class TabCell: UICollectionViewCell {
    @IBOutlet weak var tabTitle: UILabel!
    @IBOutlet weak var tabCloseButton: UIButton!
    var tabID = 0
    var delegate: TabCellDelegate!

    // ボタンと紐付ける
    @IBAction func tapCloseButton(_ sender: UIButton) {
        delegate.tabClose(button: sender)
    }
}
