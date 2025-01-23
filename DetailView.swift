//
//  ListView.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/29/24.
//

import SwiftUI


// Create the main View ( DetailView )
// Displaying a List of activities created and saved.

struct DetailView: View {
    @ObservedObject var activities = Activities()  // Observe the array of activities to update Views for any changes made by user
    
    @State private var showingSheet = false // Track if the DetailSheet is showing

    
    var body: some View {
        
        NavigationStack{
            
            List{
                // --- HEADER ----
                HStack{
                    Text("Title")
                    Spacer()
                    Text("Times completed")
                }
                .font(.caption).foregroundStyle(.gray)
                .padding(.horizontal)
                
                // Display each activity using it's unique ID. Use a NavigationLink for each activity to take you to the DetailSheet to display full description
                
                ForEach(activities.activityList, id: \.id){ activity in
                    NavigationLink(value: activity){
                        
                        // Display a Short Preview of description in the List
                        
                        // 1- Get activity.Description
                        // 2- Get first 10 characters
                        // 3- Display first 10 characters of activity.Description
                        
                        let str = activity.description
                        
                        // Indexes between 0..<10 ---- //(startIndex(0)) and inner (index 10)
                        
                        
                        
                        let index = str.startIndex..<str.index(str.startIndex, offsetBy: 10)
                        
                        // string[0..<10]
                        // Display indexes 0..<10 from the string
                        let previewStr = str[index]
                        
                        
                        
                        // ---- Each ACTIVITY Row inside the List
                        HStack{
                            
                            VStack(alignment: .leading){
                                
                                
                                Text(activity.title)
                                    .font(.callout)
                                    .bold()
                                    
                                    
                                    Text("\(previewStr)...")
                                        
                                
                                    .foregroundStyle(.gray)
                                    .font(.footnote)
                                
                            }
                                HStack{
                                    
                                    Spacer()
                                    ZStack{
                                        Circle()
                                            .fill(Color(UIColor.systemFill)).opacity(0.3)
                                            .frame(maxWidth: 45, maxHeight: 45)
                                            .shadow(color: .black.opacity(0.5), radius: 5, x: 3.5, y: 3.5)
                                            .padding(.horizontal)
                                            
                                        // Display individual updated count of activity completion
                                        Text("\(activity.tapCompletionCount)")
                                        
                                    }
                                    
                                }
                            
                            
                        }
                        
                    }
                    .padding(4)
                    
                    
                    
                }
                
                
                // Remove rows by offsets specific location
                .onDelete(perform: removeRows)
                
            }
            
 
            // Each NavigationLink will have a Destination of its own Activity info
            
            .navigationDestination(for: Activity.self) { activity in
                DetailSheet( activities: activities, title: activity.title , description: activity.description, tapCompletionCount:activity.tapCompletionCount)
            }
            .navigationTitle("Habit-Tracking")
            
            .navigationBarTitleDisplayMode(.inline)
            
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    // When Button is tapped, it will open the NewActivity Sheet View where User can add/create new activity
                    Button(action: {
                        
                        showingSheet.toggle()
                        
                    }){
                        Image(systemName: "plus")
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.blue)
                            .padding(.trailing, -25)
                            
                        

                    }
                }
            
            }
            // If showingSheet is TRUE = Display NewActivity Sheet
            .sheet(isPresented: $showingSheet){
                NewActivity( activities: activities)
            }
        }
                
            
            

        }
    
        

    
// Create a function to remove Each row at the specified offSets where is located
    func removeRows( at offsets: IndexSet ){
        activities.activityList.remove(atOffsets: offsets)
    }

    }
#Preview {
    DetailView()
}
