//
//  FirstViewController.swift
//  mockTabCollectionView
//
//  Created by mzgk on 2016/11/08.
//  Copyright © 2016年 mzgk. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var itemCount = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func tapAddButton(_ sender: UIButton) {
        // DataSourceに＋１して、更新
        itemCount += 1
        collectionView.reloadData()
    }

    @IBAction func tapRemoveButton(_ sender: UIButton) {
        // ボタンがタップされたセルを取得
        let cell = sender.superview?.superview as! UICollectionViewCell
        let indexPath = collectionView.indexPath(for: cell)

        // DataSourceを－１して、Itemを削除し、更新
        itemCount -= 1
        collectionView.deleteItems(at: [indexPath!])
        collectionView.reloadData()

        // もし０個になったら、１個作成
        if itemCount == 0 {
            itemCount += 1
            collectionView.reloadData()
        }
    }

// MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath) as! TabCell

        cell.tabTitle.text = String(indexPath.row)
        return cell
    }
}

