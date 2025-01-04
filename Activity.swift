//
//  Activity.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/27/24.
//

import SwiftUI

struct Activity: Hashable, Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String

}

@Observable
class Activities {
     var activityList = [Activity](){
        
        didSet {
            if let encoded = try? JSONEncoder().encode(activityList) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        
        
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities"){
            
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                
                activityList = decodedActivities
                return
            }
        }
        
        activityList = []
    }
    
}



//#Preview {
//    Activity()
//}
