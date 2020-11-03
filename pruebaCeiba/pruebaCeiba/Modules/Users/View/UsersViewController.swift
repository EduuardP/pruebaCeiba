//
//  UsersViewController.swift
//  pruebaCeiba
//
//  Created by IMac on 30/10/20.
//

import UIKit

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = UsersViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        getUsers()
        // Do any additional setup after loading the view.
    }
    
    
    func getUsers() {
        showLoading()
        viewModel.getUsers {
            self.viewModel.loadData()
            self.tableView.reloadData()
            self.hiddenLoading()
        } failed: {
            self.hiddenLoading()
        }

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
