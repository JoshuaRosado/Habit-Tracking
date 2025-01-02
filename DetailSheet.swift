//
//  DetailSheet.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/31/24.
//

import SwiftUI

struct ActivityCompleted: Codable{
    var completedCount: Int
}
 
 
struct DetailSheet: View{
    var number : Int
    var title : String
    var description : String
    @State private var tapCount = ActivityCompleted(completedCount: 0)
    
    
    var body: some View {
        NavigationStack{
            
            
            VStack{
                
                
                Text("Description: \(description)")
                    .padding(.top, 50)

                Spacer()
                HStack{
                    Button("Done"){
                        tapCount.completedCount += 1
                        
                        let encoder = JSONEncoder()
                        
                        if let data = try? encoder.encode(tapCount.completedCount){
                            UserDefaults.standard.set(data, forKey: "Tap")
                        }
                        
                    }
                    .buttonBorderShape(.roundedRectangle)
                    .buttonStyle(.bordered)
                    Text("Times completed : \(tapCount.completedCount)")
                    
                }
            }
            .navigationTitle(title)
        }
        
    }
}


#Preview {
    DetailSheet(number: 0)
}
