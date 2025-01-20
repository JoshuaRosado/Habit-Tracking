//
//  Activity.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/27/24.
//

import SwiftUI

// Create activity with title, description and track the completion of each one. Use Codable to save data.

struct Activity: Hashable, Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var tapCompletionCount: Int = 0
    
    
    

}

// Create a class of an Array of activities (Using Activity Struct created previously).

// Use @ObservableObject to "Observe Changes"

class Activities: ObservableObject{
    
    // Then Use @Published to track the changes and update them in the View
    
    // Every time we update, delete or create an activity
    
     @Published var activityList = [Activity](){
        
         // Try saving up the data (ENCODED)  from the Array of activites using UserDefaults
        didSet {
            if let encoded = try? JSONEncoder().encode(activityList) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        
        
        if let savedActivities = UserDefaults.standard.data(forKey: "Activities"){
            // If the data from the Array of activities was saved using UserDefaults and was found
            
            // Try Decoding/ Extracting the data that was saved in the Array from each activity
            if let decodedActivities = try? JSONDecoder().decode([Activity].self, from: savedActivities) {
                
                
                
                
                activityList = decodedActivities // // If everything was succesfully, APPEND that saved DATA into the empty ARRAY of activities
                
                return // and return it (DECODED)
            }
        }
        // ELSE return empty ARRAY if something went wrong
        activityList = []
    }
    
}


