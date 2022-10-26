//
//  User.swift
//  Timer
//
//  Created by Степан Величко on 26.10.2022.
//

import FirebaseFirestoreSwift


//struct that fetch all information about users
struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let name: String
    let email: String
}
