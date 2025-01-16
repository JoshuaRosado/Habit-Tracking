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
                    
                Spacer()
                Text("Description: \(description)")
                    .padding(.top, 50)

                Spacer()
                HStack{
                    ForEach(activities.activityList){ activity in

                        if activity.title == title {
                            Text("Times completed : \(activity.tapCompletionCount)")
                            
                                .onTapGesture {
                                    handleTapGesture(for: activity)
                                    //                        }
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
