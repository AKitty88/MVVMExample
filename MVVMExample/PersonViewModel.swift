//
//  PersonViewModel.swift
//  MVVMExample
//
//  Created by User on 22/6/21.
//

import UIKit

struct PersonViewModel {
    let name: String
    let userName: String
    var isFollowing: Bool
    let image: UIImage?
    
    init(with model: Person) {
        name = model.name
        userName = model.userName
        isFollowing = model.isFollowing
        image = UIImage(systemName: "person")
    }
}
