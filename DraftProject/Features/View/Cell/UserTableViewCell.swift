//
//  UserTableViewCell.swift
//  DraftProject
//
//  Created by cavID on 06.05.24.
//

import UIKit
import SnapKit

class UserTableViewCell: UITableViewCell {
    static let id : String = "\(UserTableViewCell.self)"
    var titleLabel: UILabel  = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    var subTitleLabel : UILabel = UILabel()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureConstraint()	
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


private extension UserTableViewCell {
    func configure(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
    }
    func configureConstraint(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(20)
            
        }
        
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(20)
            make.left.equalTo(20)
            make.bottom.equalToSuperview()
        }
        
    }
}
