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
    var Index = 1

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
        Index += 1
        collectionView.reloadData()
    }

    @IBAction func tapRemoveButton(_ sender: UIButton) {
    }

// MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Index
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabCell", for: indexPath)

        let titleLabel = cell.contentView.viewWithTag(1) as! UILabel
        titleLabel.text = String(indexPath.row + 1)

        return cell
    }
}

