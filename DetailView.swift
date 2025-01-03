//
//  ListView.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/29/24.
//

import SwiftUI



struct DetailView: View {
    @State private var activities = Activities()
    @State private var showingSheet = false
    @State private var tapCount = ActivityCompleted(completedCount: 0)
    
    var body: some View {
        
        NavigationStack{
            List{
                
                ForEach(activities.activityList, id: \.id){ i in
                    NavigationLink("\(i.title)",value: i)
                    
                }
            }
            .navigationDestination(for: Activity.self) { activity in
                DetailSheet(title: activity.title, description: activity.description)
            }
                
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        
                        showingSheet.toggle()
                        
                    }){
                        Image(systemName: "plus")
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.blue)
                            .padding(-15)
                        
                    
                    }
                }
                
            }
            .sheet(isPresented: $showingSheet){
                NewActivity( activities: activities)
            }
            .navigationTitle("Habit-Tracking")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
            
        }
        
                
        }
    }
#Preview {
    DetailView()
}
