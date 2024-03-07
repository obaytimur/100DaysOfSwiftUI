//
//  Student.swift
//  BookWorm
//
//  Created by Oğulcan Baytimur on 07/03/2024.
//

import SwiftData
import SwiftUI

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
