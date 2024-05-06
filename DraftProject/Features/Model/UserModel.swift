//
//  UserModel.swift
//  DraftProject
//
//  Created by cavID on 06.05.24.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID
        case id, title, body
    }
}
