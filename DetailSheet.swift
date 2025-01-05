//
//  DetailSheet.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/31/24.
//

import SwiftUI
//
//struct ActivityCompleted: Codable{
//    var completedCount: Int
//}
 
 
struct DetailSheet: View{
    var title : String
    var description : String
    var tapCount = 0
//    @State private var tapCount = ActivityCompleted(completedCount: 0)
    
    
    var body: some View {

            VStack{
                HStack{
                    Text(title)
                        .font(.largeTitle).bold()
                        .padding(.horizontal,30)
                        .padding(.top, 30)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                    
                Spacer()
                Text("Description: \(description)")
                    .padding(.top, 50)

                Spacer()
                HStack{
                    Button("Done"){
//                        tapCount.completedCount += 1
//                        
//                        let encoder = JSONEncoder()
//                        
//                        if let data = try? encoder.encode(tapCount.completedCount){
//                            UserDefaults.standard.set(data, forKey: "Tap")
//                        }
                        
                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.bordered)
                    Text("Times completed : \(tapCount)")
//                    Text("Times completed : \(tapCount.completedCount)")
                    
                }

        }
        
    }
}


#Preview {
    DetailSheet(title: "Title", description: "Description")
}
