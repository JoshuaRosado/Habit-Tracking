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
            
            List{
                HStack{
                    Text("Title")
                    Spacer()
                    Text("Times completed")
                }
                .font(.caption).foregroundStyle(.gray)
                .padding(.horizontal)
                
                
                ForEach(activities.activityList, id: \.id){ activity in
                    NavigationLink(value: activity){
                        
                        
                        let str = activity.description
                        let index = str.startIndex..<str.index(str.startIndex, offsetBy: 10)
                        let previewStr = str[index]
                        
                        
                        HStack{
                            
                            VStack(alignment: .leading){
                                
                                
                                Text(activity.title)
                                    .font(.title3)
                                    
                                    
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
                                            
                                        Text("\(activity.tapCompletionCount)")
                                        
                                    }
                                    
                                }
                            
                            
                        }
                        
                    }
                    .padding(10)
                    
                    
                    
                }
                
                
                
                .onDelete(perform: removeRows)
                
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
                            .padding(.trailing, -25)
                            
                        

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

    }
#Preview {
    DetailView()
}
