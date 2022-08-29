//
//  MainVC.swift
//  Four_SubwayStation
//
//  Created by 이윤수 on 2022/08/22.
//

import UIKit

import SnapKit
import Then
import Alamofire

class MainVC: UITableViewController {
    var cells = 0
    var stations : [row] = []

    lazy var searchController = UISearchController(searchResultsController: ResultSearchVC()).then{
        $0.searchBar.placeholder = "지하철 역을 입력하세요."
        $0.obscuresBackgroundDuringPresentation = false
        $0.searchBar.delegate = self
        $0.searchResultsUpdater = self
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
    
    func requestStationName(stationName : String){
        let urlString = "http://openapi.seoul.go.kr:8088/sample/json/SearchInfoBySubwayNameService/1/5/\(stationName)"
        AF.request(urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "").responseDecodable(of: StationModel.self){ [weak self] response in
            switch response.result{
            case let .success(data):
                print(data)
                self?.stations = data.SearchInfoBySubwayNameService.row
            case let .failure(error):
                print(error)
            }
        }
    }
}

extension MainVC{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
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
        // 검색 시작 시
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        // 검색 끝날 때
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.requestStationName(stationName: searchText)
    }
}

extension MainVC : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let resultVC = searchController.searchResultsController as? ResultSearchVC
        resultVC?.stations = self.stations
        print(resultVC)
    }
}
