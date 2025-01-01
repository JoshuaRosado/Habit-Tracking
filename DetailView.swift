//
//  ListView.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/29/24.
//

import SwiftUI



struct DetailView: View {
    @State private  var activities = Activities()
    @State private var showingSheet = false
    @State private var tapCount = ActivityCompleted(completedCount: 0)
    
    var body: some View {
        
        NavigationStack{
            
            ForEach(activities.activityList, id: \.id){ i in
                NavigationLink("\(i)", value: i)
                
            }
            .navigationDestination(for: Int.self) { number in
                DetailSheet(number: number)
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
                NewActivity()
            }
            .navigationTitle("Habit-Tracking")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
            
        }
        
                
        }
    }
#Preview {
    DetailView()
}
