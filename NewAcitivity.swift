//
//  NewAcitivity.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/28/24.
//

import SwiftUI

// Create a form for new activities, with title and description properties.


struct NewActivity: View {
    
    @Environment(\.dismiss) var dismiss // Dismiss action
    @State private var title : String = ""
    @State private var description: String = ""
    
    @ObservedObject var activities : Activities // Observe the array of activities to update Views for any changes made by user
    
    var body: some View {
        VStack{
            NavigationStack{
                Form{
                    VStack(alignment: .leading){
                        Section("Title"){
                            
                            
                            TextField("Minimum of 3 characters", text:  $title)
                        }
                        .padding(.bottom, 3)
                        
                        Rectangle()
                            .stroke(.gray.opacity(0.2), lineWidth: 1)
                            .frame(width: .infinity, height: 0.7)
                        
                        Spacer()
                    
                        
                        
                        
                        VStack(alignment: .leading){
                            Section("Description"){
                                TextField("Minimum of 15 characters", text: $description)
                            }
//
                        }
                        .padding(.bottom, 5)
                        
                        
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing){
                            
                            let newActivity = Activity(title: title, description: description, tapCompletionCount:0 )
                            Button(action: {
                                
                                // Button function
                                
                                if description.count < 15 { // Description field has to be 15 characters or more. If less,
                                    // dismiss the sheet.
                                    dismiss()
                                    
                                } else {
                                    
                                    // If Description equal or greater than 15 characters
                                    // Append new activity to the Array(activityList)
                                    activities.activityList.append(newActivity)
                                
                                    // And then dismiss the sheet
                                    dismiss()
                                }
                                
                            }){
                                Text("Create")
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.blue)
                                    .padding(-15)
                                
                            
                            }
                        }
                        
                        ToolbarItem(placement: .topBarLeading){
                            Button("Cancel",action: {
                                
                                dismiss()
                            })
                            .padding(5)
                        }
                    }

                    
                    
                }
                .navigationTitle("New activity")
                .navigationBarTitleDisplayMode(.inline)
                
            }
            
        }
        
    }
    
}

