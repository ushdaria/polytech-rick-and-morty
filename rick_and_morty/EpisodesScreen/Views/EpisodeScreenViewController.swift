//
//  EpisodeScreenViewController.swift
//  rick_and_morty
//
//  Created by Daria Ushakova on 22.11.2022.
//

import UIKit

protocol IEpisodeScreenViewController: AnyObject {
    func setData(data: [EpisodeScreenModel])
}

class EpisodeScreenViewController: UIViewController {

    private var collectionView: UICollectionView?
    
    private let presenter: IEpisodesScreenPresenter
    
    // array of data from API from presenter
    private var episodesData: [EpisodeScreenModel]
    
    init(presenter: IEpisodesScreenPresenter) {
        self.presenter = presenter
        self.episodesData = []
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //topBar
        title = "Episodes"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backToPrevious))
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemBlue]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width/3)-4, height: (view.frame.size.height/4)-4)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(EpisodeViewCell.self,
                                 forCellWithReuseIdentifier: EpisodeViewCell.identifier)
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

extension EpisodeScreenViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return episodesData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EpisodeViewCell.identifier, for: indexPath) as! EpisodeViewCell
        
        cell.configure(name: episodesData[indexPath.row].name, number: episodesData[indexPath.row].number, date: episodesData[indexPath.row].date)
        
        return cell
    }
}

extension EpisodeScreenViewController : IEpisodeScreenViewController{
    func setData(data: [EpisodeScreenModel]) {
        self.episodesData = data
        collectionView?.reloadData();
    }
}
