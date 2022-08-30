//
//  DetailVC.swift
//  Four_SubwayStation
//
//  Created by 이윤수 on 2022/08/25.
//

import UIKit

import Then
import SnapKit
import Alamofire

class DetailVC : UITableViewController{
    
    let row : row
    var realTimeArrivalList : StationArrivalModel?
    
    init(row : row){
        self.row = row
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var viewRefreshControl = UIRefreshControl().then{
        $0.addTarget(self, action: #selector(fetchData), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        self.viewSet()
        self.fetchData()
    }
    
    @objc func fetchData(){
        let urlString = "http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5/\(self.row.stationName.replacingOccurrences(of: "역", with: ""))"
        AF.request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "").responseDecodable(of: StationArrivalModel.self){[weak self] response in
            self?.refreshControl?.endRefreshing()
            
            switch response.result{
            case let .success(data):
                self?.realTimeArrivalList = data
                self?.tableView.reloadData()
            case let .failure(error):
                print(error)
            }
        }
    }
}

extension DetailVC {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DetailCell else {return UITableViewCell()}
        cell.bound.text = self.realTimeArrivalList?.realtimeArrivalList[indexPath.row].bound
        cell.direction.text = self.realTimeArrivalList?.realtimeArrivalList[indexPath.row].currentStation
        cell.now.text = self.realTimeArrivalList?.realtimeArrivalList[indexPath.row].remainTime
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.realTimeArrivalList?.realtimeArrivalList.count ?? 0
    }
    
    
    func viewSet(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)
        self.tableView.register(DetailCell.self, forCellReuseIdentifier: "cell")
        self.title = self.row.stationName
        self.tableView.refreshControl = self.viewRefreshControl
    }
}
