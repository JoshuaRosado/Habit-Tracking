//
//  DetailSheet.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/31/24.
//

import SwiftUI
//
struct ActivityCompleted: Codable{
    var completedCount: Int
} 
 
 
struct DetailSheet: View{
    var activities: Activities
//    var newActivity = data.activities[index]
    var title : String
    var description : String

    @State var tapCount : Int
    @AppStorage("tapCompletionCount") private var tapCompletionCount = 0
//    @State private var tapCount = ActivityCompleted(completedCount: 0)
    
    
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
                    Button("Done"){
                        tapCompletionCount += 1
                        
                        let encoder = JSONEncoder()
                        
                        if let data = try? encoder.encode(tapCompletionCount){
                            UserDefaults.standard.set(data, forKey: "Tap")
                         }
                         
                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.bordered)
//                    Text("Times completed : \(tapCount)")
                    Text("Times completed : \(tapCompletionCount)")
                    
                }
 
        }
        
    }
}


#Preview {
    let act = Activities()

    DetailSheet(activities: act, title: "Title", description: "Description", tapCount: 0)
}
