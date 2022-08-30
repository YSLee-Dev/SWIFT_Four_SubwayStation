//
//  ResultSearchVC.swift
//  Four_SubwayStation
//
//  Created by 이윤수 on 2022/08/29.
//

import UIKit

import SnapKit
import Then

class ResultSearchVC: UITableViewController {
    var stations : [row] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSet()
    }
}

private extension ResultSearchVC {
    func viewSet(){
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        self.view.backgroundColor = .white
        
        self.tableView.register(SubwayListCell.self, forCellReuseIdentifier: "cell")
        self.tableView.separatorStyle = .none
    }
}

extension ResultSearchVC{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.stations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SubwayListCell else {return UITableViewCell()}
        cell.title.text = stations[indexPath.row].stationName
        cell.line.text = stations[indexPath.row].lineNumber
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = UINavigationController(rootViewController: DetailVC(row: self.stations[indexPath.row]))
        self.present(detail, animated: true)
    }
}
