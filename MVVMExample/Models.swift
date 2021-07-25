//
//  Models.swift
//  MVVMExample
//
//  Created by User on 21/6/21.
//

import Foundation

enum Gender {
    case male, female, unspecified
}

struct Person {
    var name: String
    var userName: String = "DefaultUserName"
    let birthDate: Date?
    let middleName: String?
    let address: String?
    let gender: Gender
    var isFollowing = false
    
    init(name: String,
         birthDate: Date? = nil,
         middleName: String? = nil,
         address: String? = nil,
         gender: Gender = .unspecified
    ) {
        self.name = name
        self.birthDate = birthDate
        self.middleName = middleName
        self.address = address
        self.gender = gender
        self.isFollowing = false
    }
}
