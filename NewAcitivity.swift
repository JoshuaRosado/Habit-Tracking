//
//  NewAcitivity.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/28/24.
//

import SwiftUI

struct NewActivity: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var title : String = ""
    @State private var description: String = ""
    
    @ObservedObject var activities : Activities
    
    var body: some View {
        VStack{
            NavigationStack{
                Form{
                    VStack(alignment: .leading){
                        Section("Title"){
                            
                            
                            TextField("", text:  $title)
                        }
                        
                        VStack{
                            Section("Description"){
                                TextField("Minimum of 15 characters", text: $description)
                            }
//                            Text("Minimum of 15 characters")
//                                .font(.footnote)
//                                .foregroundStyle(.gray)
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing){
                            let newActivity = Activity(title: title, description: description, tapCompletionCount:0 )
                            Button(action: {
                                
                                if description.count < 15 {
                                    dismiss()
                                } else {
                                    
                                    
                                    activities.activityList.append(newActivity)
                                    print("Activity: \(newActivity), was added to \(activities.activityList)")
                                    
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

