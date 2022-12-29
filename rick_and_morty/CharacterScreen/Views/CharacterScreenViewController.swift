//
//  CharacterScreenView.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 20.11.2022.
//

import Foundation
import UIKit

protocol ICharacterScreeenDelegate: AnyObject {
    func setData(data: [CharacterScreenModel])
}

class CharacterScreenViewController: UIViewController, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        // на каждый тык запрос - не очень круто, но проект учебный)
        presenter.getData(status: self.status, gender: self.status, name: text)
    }
    
    
    private let presenter: ICharacterScreenPresenter
    private let name : String?
    private let status: String?
    private let gender: String?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(presenter: ICharacterScreenPresenter, status: String?, gender: String?, name: String?) {
        self.name = name
        self.status = status
        self.gender = gender
        self.presenter = presenter
        charactersData = []
        super.init(nibName: nil, bundle: nil)
    }
    
    private var collectionView: UICollectionView?
    
    // array of data from API from presenter
    private var charactersData: [CharacterScreenModel]
    
    private let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //topBar
        title = "Characters"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToPrevious))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filter"), style: .plain, target: self, action: #selector(showFilters))
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemBlue]
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width/3) - 4, height: (view.frame.size.width/3)-4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(CharacterViewCell.self,
                                 forCellWithReuseIdentifier: CharacterViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .black
        
        presenter.getData(status: status, gender: gender, name: name)
    }
    
    @objc private func backToPrevious(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func showFilters(){
        let assemble = FilterScreenAssemble()
        navigationController?.pushViewController(assemble.assembly(), animated: true)
    }
}

extension CharacterScreenViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterViewCell.identifier, for: indexPath) as! CharacterViewCell
        
        cell.configure(labelText: charactersData[indexPath.row].name, imageUrl: charactersData[indexPath.row].imgURL)
        
        return cell
    }
}

extension CharacterScreenViewController : ICharacterScreeenDelegate{
    func setData(data: [CharacterScreenModel]) {
        self.charactersData = data
        collectionView?.reloadData();
    }
}
