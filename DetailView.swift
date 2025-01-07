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

    @AppStorage("tapCompletionCount") private var tapCompletionCount = 0
    
    var body: some View {
        
        NavigationStack{
            List{
                
                ForEach(activities.activityList, id: \.id){ activity in
                    NavigationLink(value: activity){
                        Text(activity.title)
                        Text("Completed \(activity.tapCompletionCount)")
                    }
                    
                }
                .onDelete(perform: removeRows)
            }
            .navigationDestination(for: Activity.self) { activity in
                DetailSheet( activities: activities, title: activity.title , description: activity.description, tapCount:activity.tapCompletionCount)
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
    func removeRows( at offsets: IndexSet ){
        activities.activityList.remove(atOffsets: offsets)
    }
    }
#Preview {
    DetailView()
}
