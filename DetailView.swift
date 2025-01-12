//
//  ListView.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/29/24.
//

import SwiftUI



struct DetailView: View {
    @ObservedObject var activities = Activities()
    @State private var showingSheet = false

    
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                
                RadialGradient(colors: [Color.white.opacity(0.5), Color.mint.opacity(0.6)] ,center: .top, startRadius: 900, endRadius: 5)
                    .ignoresSafeArea()
                VStack{
                    
                    ForEach(activities.activityList, id: \.id){ activity in
                        NavigationLink(value: activity){
                            HStack{
                                
                                VStack(alignment: .leading){
                                    
                                    
                                    Text(activity.title)
                                        .font(.title3)
                                    Text("Completed: ")
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                    
                                }
                                HStack{
                                    
                                    Spacer()
                                    ZStack{
                                        Circle()
                                            .fill(.white)
                                            .frame(maxWidth: 45, maxHeight: 45)
                                            .shadow(color: .black.opacity(0.1), radius: 4, x: 2.5, y: 2.5)
                                            .padding(.horizontal)
                                        
                                        Text("\(activity.tapCompletionCount)")
                                    }
                                    
                                }
                                
                                
                            }
                            
                        }
                        .padding(10)
                        
                        
                        
                    }
                    
                    
                    
                    .onDelete(perform: removeRows)
                    
                }
            }
            
            
            
            
            
            
            
            .navigationDestination(for: Activity.self) { activity in
                DetailSheet( activities: activities, title: activity.title , description: activity.description, tapCompletionCount:activity.tapCompletionCount)
            }
            .navigationTitle("Habit-Tracking")
            
            .navigationBarTitleDisplayMode(.inline)
            
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        
                        showingSheet.toggle()
                        
                    }){
                        Image(systemName: "plus")
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.blue)
                            .padding(15)
                            
                        

                    }
                }
            
            }
            .sheet(isPresented: $showingSheet){
                NewActivity( activities: activities)
            }
        }
                
            
            

        }
    
        

    

    func removeRows( at offsets: IndexSet ){
        activities.activityList.remove(atOffsets: offsets)
    }

//    private func handleTapGesture(for activity: Activity) {
//      
//           if let index = activities.activityList.firstIndex(where: { $0.id == activity.id }) {
//
//               incrementCompletionCount(at: index)
//           }
//       }
//
//    
//    private func incrementCompletionCount(at index: Int){
//        activities.activityList[index].tapCompletionCount += 1
//    }
    }
#Preview {
    DetailView()
}
