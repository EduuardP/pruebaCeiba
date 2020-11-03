//
//  UsersViewController.swift
//  pruebaCeiba
//
//  Created by IMac on 30/10/20.
//

import UIKit

class UsersViewController: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblEmpty: UILabel!
    @IBOutlet weak var searhView: UISearchBar!
    
    let viewModel = UsersViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        getUsers()
        // Do any additional setup after loading the view.
    }
    
    
    func getUsers() {
        showLoading()
        viewModel.getUsers {
            self.tableView.reloadData()
            self.verificarDatosVacios()
            self.hiddenLoading()
        } failed: {
            self.hiddenLoading()
            self.verificarDatosVacios()
        }

    }
    
    func initView() {
        searhView.delegate = self

    }
    
    func verificarDatosVacios(){
        
        lblEmpty.isHidden = viewModel.containerIsZero()
        tableView.isHidden = !viewModel.containerIsZero()
        
    }
    
    func filtrarUsuarios(text:String) {
        viewModel.filtrarUsuarios(text: text)
        verificarDatosVacios()
        tableView.reloadData()
        
    }
    @objc func irPost(_ sender:UIButton){
        
        irPosts(user: viewModel.container[sender.tag].obj!)
        
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

extension UsersViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.container.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.viewModel.container[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cell) as! UsersTableViewCell
        cell.setup(user:item.obj!)
        
        cell.btnVerPublicaciones.tag = indexPath.row
        cell.btnVerPublicaciones.addTarget(self, action: #selector(irPost(_:)), for: .touchUpInside)
        return cell
    }
}


extension UsersViewController:UISearchBarDelegate{
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtrarUsuarios(text: searchText)
    }
    
    
}
