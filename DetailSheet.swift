//
//  DetailSheet.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/31/24.
//

import SwiftUI
//

 
struct DetailSheet: View{
    @ObservedObject var activities: Activities

    var title : String
    var darkBlue: Color{
        Color(red: 0, green: 0, blue: 0.1)
    }
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
                        
                        if activity.title == title {
                            //
                            
                            Text("Times completed :")
                            ZStack{
                                
                                
                                Circle()
                                    .fill(Color(UIColor.systemFill)).opacity(0.3)
                                    .frame(maxWidth: 45, maxHeight: 45)
                                    .shadow(color: .black.opacity(0.5), radius: 5, x: 3.5, y: 3.5)
                                Button("\( activity.tapCompletionCount)"){
                                    
                                    handleTapGesture(for: activity)
                                    
                                }
                            }
                            
                            
                        }
                    }
                }
            }
        
        
            
        
    }
    private func handleTapGesture(for activity: Activity) {
      
           if let index = activities.activityList.firstIndex(where: { $0.id == activity.id }) {

               incrementCompletionCount(at: index)
           }
       }

    
    private func incrementCompletionCount(at index: Int){
        activities.activityList[index].tapCompletionCount += 1
    }
}


#Preview {
    let act = Activities()

    DetailSheet(activities: act, title: "Title", description: "Description", tapCompletionCount: 0)
}
