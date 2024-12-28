//
//  Activity.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/27/24.
//

import SwiftUI

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    let title: String
    let description: String

}

@Observable
class Activities {
    @State private var activityList : [Activity] = []
    
    
    
}

//#Preview {
//    Activity()
//}
