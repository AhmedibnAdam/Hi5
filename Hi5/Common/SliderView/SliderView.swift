//
//  SliderView.swift
//  SliderDemo
//
//  Created by Ahmed M. Hassan on 1/10/20.
//  Copyright © 2020 Ahmed M. Hassan. All rights reserved.
//

import UIKit

class SliderView: UIView {
    
    public var list = [UIImage]() {
        didSet { collectionView.reloadData() }
    }
    
    private var currentIndex: Int? {
        return collectionView.indexPathsForVisibleItems.first?.row
    }
    
    var nextView: NextView!
    var previousView: NextView!
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
//        layout.itemSize = CGSize(width: self.bounds.width, height: self.bounds.height)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "\(ImageCollectionViewCell.self)")
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        commitInit()
    }
    
    private func commitInit() {
        // Setup collection view
        self.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        collectionView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        // Setup next & previous views
        nextView = NextView(direction: .right, addTo: self)
        nextView.delegate = self
        previousView = NextView(direction: .left, addTo: self)
        previousView.delegate = self
    }
    
    fileprivate func next() {
        guard let currentIndex = currentIndex else { return }
        if currentIndex < list.count - 1 {
            self.collectionView.scrollToItem(at: IndexPath(row: currentIndex + 1, section: 0),
                                             at: .centeredHorizontally, animated: true)
        }
    }
    
    fileprivate func previous() {
        guard let currentIndex = currentIndex else { return }
        if currentIndex > 0 {
            self.collectionView.scrollToItem(at: IndexPath(row: currentIndex - 1, section: 0),
                                             at: .centeredHorizontally, animated: true)
        }
    }
    
}

extension SliderView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(ImageCollectionViewCell.self)", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.image = list[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
}

extension SliderView: NextViewDelegate {
    
    func nextView(_ view: NextView, nextButtonTapped button: UIButton) {
        switch view {
        case nextView:
            self.next()
        case previousView:
            self.previous()
        default:
            break
        }
    }
    
}

