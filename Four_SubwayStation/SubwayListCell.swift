//
//  SubwayListCell.swift
//  Four_SubwayStation
//
//  Created by 이윤수 on 2022/08/25.
//

import UIKit

import Then
import SnapKit

class SubwayListCell : UITableViewCell{
    
    let title = UILabel().then{
        $0.font = .boldSystemFont(ofSize: 15)
    }
    
    let line = UILabel().then{
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .gray
    }
    
    override func layoutSubviews() {
        self.addSubview(self.title)
        self.addSubview(self.line)
        
        self.title.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(10)
        }
        
        self.line.snp.makeConstraints{
            $0.centerY.equalTo(self.title)
            $0.trailing.equalToSuperview().inset(10)
        }
        
        self.backgroundColor = .white
    }
}
