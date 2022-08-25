//
//  DetailCell.swift
//  Four_SubwayStation
//
//  Created by 이윤수 on 2022/08/25.
//

import UIKit

import Then
import SnapKit

class DetailCell : UITableViewCell{
    
    let now = UILabel().then{
        $0.font = .boldSystemFont(ofSize: 18)
    }
    
    let direction = UILabel().then{
        $0.font = .systemFont(ofSize: 15)
    }
    
    let bound = UILabel().then{
        $0.font = .boldSystemFont(ofSize: 18)
        $0.layer.backgroundColor = UIColor.red.cgColor
    }
    
    override func layoutSubviews(){
        self.addSubview(self.now)
        self.addSubview(self.direction)
        self.addSubview(self.bound)
        
        self.bound.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(10)
            $0.centerY.equalToSuperview()
        }
        
        self.direction.snp.makeConstraints{
            $0.leading.equalTo(self.bound.snp.trailing).offset(5)
            $0.centerY.equalTo(self.bound)
        }
        
        self.now.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(10)
            $0.centerY.equalTo(self.bound)
        }
    }
}
