//
//  DetailSheet.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/31/24.
//

import SwiftUI
//

 
struct DetailSheet: View{
    @ObservedObject var activities: Activities  // Observe the array of activities to update Views for any changes made by user
    @Environment(\.dismiss) var dismiss
    var title : String

    var description : String
    @State var tapCompletionCount : Int

    
    
    var body: some View {
            
            VStack{
                HStack{
                    Text(title)
                        .font(.largeTitle).bold()
                        .padding(.horizontal,30)
                        .padding(.top,30)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                
                VStack{
                    
                    Text(description)
                        .padding(20)
                    
                }
                .frame(minWidth: 375, alignment: .leading)
                
                
                Spacer()
                HStack{
                    ForEach(activities.activityList){ activity in
                        
                        // Display Competion Count according to the NavigationLink selected
                        
                        if activity.title == title {

                            ZStack{
                                
                                
                                Rectangle()
                                    .fill(Color(UIColor.systemFill)).opacity(0.3)
                                    .frame(minWidth: 200, maxHeight: 45)
                                    .shadow(color: .black.opacity(0.5), radius: 5, x: 3.5, y: 3.5)
                                Text("Times completed : \(activity.tapCompletionCount)")
                            }
                            
                            
                        }
                    }
                    
                }
            }
    
            .toolbar {
                ForEach(activities.activityList){ activity in
                    // Display the Complete button for the Activity Selected
                    if activity.title == title {
                        Button("Complete"){
                            handleTapGesture(for: activity)
                            
                            dismiss()
                        }
                        .padding(.trailing, 10)
                    }
                }
            }
            
        
        
            
        
    }
    private func handleTapGesture(for activity: Activity) {
      
        // constant index = The first index of the activity array. In this case the ID was already selected so there should be only one object inside the Array
        
           if let index = activities.activityList.firstIndex(where: { $0.id == activity.id }) {

               
               incrementCompletionCount(at: index)
           }
       }

    
    private func incrementCompletionCount(at index: Int){
        // Increment the tapCompletionCount by one of the activity inside of the Array  = activityList
        activities.activityList[index].tapCompletionCount += 1
    }
}


#Preview {
    let act = Activities()

    DetailSheet(activities: act, title: "Title", description: "Description", tapCompletionCount: 0)
}
