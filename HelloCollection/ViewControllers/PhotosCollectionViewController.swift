//
//  PhotosCollectionViewController.swift
//  HelloCollection
//
//  Created by Сперанский Никита on 10.05.2021.
//

import UIKit



class PhotosCollectionViewController: UICollectionViewController {

    let photos = ["legacy1", "legacy2", "legacy3", "legacy4", "legacy5", "legacy6"]
    
    let itemPerRow: CGFloat = 2
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        способ №2 настройки интерфейса
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 1
//        layout.minimumInteritemSpacing = 1
//        layout.scrollDirection = .vertical
//
//        collectionView.showsVerticalScrollIndicator = false // так можно убрать полоску справа
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.legacyImageView.image = image
        cell.backgroundColor = .black
        return cell
    }
}



//способ №1 настройки интерфейса
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {

    // данным методом можем явно определять размер ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInserts.left * (itemPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    //метод создающий отступы для коллекции - левой границы телефона, правой верхней, нижней
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    // метод для настраивания отступов по рядам и по линиям
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
