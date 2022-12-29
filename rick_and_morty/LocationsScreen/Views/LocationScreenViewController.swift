//
//  LocationScreenViewController.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 21.11.2022.
//

import UIKit

protocol ILocationScreeenDelegate: AnyObject {
    func setData(data: [LocationScreenModel])
}

class LocationScreenViewController: UIViewController {
    
    private var collectionView: UICollectionView?
    private let presenter: ILocationScreenPresenter
    
    // array of data from API from presenter
    private var locationsData: [LocationScreenModel]
    
    init(presenter: ILocationScreenPresenter) {
        self.presenter = presenter
        locationsData = []
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //topBar
        title = "Locations"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToPrevious))
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemBlue]
        //navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4, height: (view.frame.size.height/4)-4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(LocationViewCell.self,
                                 forCellWithReuseIdentifier: LocationViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = UIColor.black
        
        presenter.getData()
    }
    
    @objc private func backToPrevious(){
        dismiss(animated: true, completion: nil)
    }
    
}

extension LocationScreenViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LocationViewCell.identifier, for: indexPath) as! LocationViewCell
        
        cell.configure(name: locationsData[indexPath.row].name, type: locationsData[indexPath.row].type, dimension: locationsData[indexPath.row].dimension)
        
        return cell
    }
}

extension LocationScreenViewController : ILocationScreeenDelegate{
    func setData(data: [LocationScreenModel]) {
        self.locationsData = data
        collectionView?.reloadData();
    }
}
