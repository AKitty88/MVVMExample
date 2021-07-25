//
//  PersonFollowingTableViewCell.swift
//  MVVMExample
//
//  Created by User on 21/6/21.
//

import UIKit

protocol PersonFollowingTableViewCellDelegate: AnyObject {
    func followButtonIsTapped(
        onCell cell: PersonFollowingTableViewCell,
        withviewModel viewModel: PersonViewModel
    )
}

class PersonFollowingTableViewCell: UITableViewCell {
    static let identifier = "PersonFollowingTableViewCell"
    
    private var viewModel: PersonViewModel?
    weak var delegate: PersonFollowingTableViewCellDelegate?
    
    private let userImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.blue
        return label
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(userImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(button)
        contentView.clipsToBounds = true
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: PersonViewModel) {
        self.viewModel = viewModel
        
        nameLabel.text = viewModel.name
        userNameLabel.text = viewModel.userName
        userImageView.image = viewModel.image
        
        if viewModel.isFollowing {
            button.setTitle("Unfollow", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
        } else {
            button.setTitle("Follow", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .link
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = contentView.frame.size.height - 10
        
        userImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: imageWidth,
            height: imageWidth
        )
        
        nameLabel.frame = CGRect(
            x: imageWidth + 10,
            y: 0,
            width: contentView.frame.size.width - imageWidth,
            height: contentView.frame.size.height / 2
        )
        
        userNameLabel.frame = CGRect(
            x: imageWidth + 10,
            y: contentView.frame.size.height / 2,
            width: contentView.frame.size.width - imageWidth,
            height: contentView.frame.size.height / 2
        )
        
        button.frame = CGRect(
            x: contentView.frame.size.width - 120,
            y: 10,
            width: 110,
            height: contentView.frame.size.height - 20
        )
    }
    
    @objc private func didTapButton() {
        guard var viewModel = viewModel else { return }
        
        viewModel.isFollowing = !viewModel.isFollowing
        delegate?.followButtonIsTapped(onCell: self, withviewModel: viewModel)
        
        prepareForReuse()
        configure(with: viewModel)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = nil
        userNameLabel.text = nil
        userImageView.image = nil
        button.backgroundColor = nil
        button.layer.borderWidth = 0
        button.setTitle(nil, for: .normal)
    }
}
