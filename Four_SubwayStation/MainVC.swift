//
//  MainVC.swift
//  Four_SubwayStation
//
//  Created by 이윤수 on 2022/08/22.
//

import UIKit

import SnapKit
import Then

class MainVC: UITableViewController {
    
    var cells = 0

    lazy var searchController = UISearchController().then{
        $0.searchBar.placeholder = "지하철 역을 입력하세요."
        $0.obscuresBackgroundDuringPresentation = false
        $0.searchBar.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSet()
    }
}

private extension MainVC {
    func viewSet(){
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "지하철 도착 정보"
        self.navigationItem.searchController = self.searchController
        
        self.view.backgroundColor = .white
        
        self.tableView.register(SubwayListCell.self, forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = .none
    }
}

extension MainVC{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.cells
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SubwayListCell else {return UITableViewCell()}
        cell.title.text = "\(indexPath.row)"
        cell.line.text = "\(indexPath.row)"
        return cell
    }
}

extension MainVC : UISearchBarDelegate{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.cells = 10
        self.tableView.reloadData()
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.cells = 0
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailVC(), animated: true)
    }
}
