//
//  HomeViewController.swift
//  pruebaCeiba
//
//  Created by IMac on 27/10/20.
//

import UIKit

class PostViewController: UIViewController {

    
    @IBOutlet var collectionView: UICollectionView!
    
    
    let viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.initViewModel()
        registerCells()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPosts()
        print(viewModel.posts.count)
    }
    

    func getPosts() {
        viewModel.getPosts()
        reloadCollection()
    }
    
    
    
    
    func registerCells() {
        let nib = UINib(nibName: viewModel.cells.post, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: viewModel.cells.post)
    }
    
    func borrarPost(index:Int){
        
        reloadCollection()
    }
    
    func reloadCollection() {
        self.collectionView.performBatchUpdates({
                            let indexSet = IndexSet(integersIn: 0...0)
                            self.collectionView.reloadSections(indexSet)
                        }, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}


extension PostViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel.container.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.container[indexPath.row]
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: item.cell, for: indexPath) as! PostCollectionViewCell
            // Configure the cell
        cell.setup(post: item.obj!)
        
            return cell
    }
    
    
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = viewModel.container[indexPath.row]
        return CGSize(width: CGFloat(collectionView.frame.width - 10), height: CGFloat(item.height))
    }
    
    
}


    
    
    
    

