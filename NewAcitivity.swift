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
                    VStack{
                        TextField("Title", text:  $title)
                        TextField("Description", text: $description)
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing){
                            let newActivity = Activity(title: title, description: description, tapCompletionCount:0 )
                            Button(action: {
                                
                                activities.activityList.append(newActivity)
                                print("Activity: \(newActivity), was added to \(activities.activityList)")
                                
                                dismiss()
                                
                                
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

