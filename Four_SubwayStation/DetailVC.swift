//
//  DetailVC.swift
//  Four_SubwayStation
//
//  Created by 이윤수 on 2022/08/25.
//

import UIKit

import Then
import SnapKit

class DetailVC : UITableViewController{
    
    override func viewDidLoad() {
        self.viewSet()
    }
}

extension DetailVC {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailCell else {return UITableViewCell()}
        cell.bound.text = "내선순환"
        cell.direction.text = "강남방면"
        cell.now.text = "교대역"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    
    func viewSet(){
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)
        self.tableView.register(DetailCell.self, forCellReuseIdentifier: "cell")
        self.title = "교대역"
    }
}
