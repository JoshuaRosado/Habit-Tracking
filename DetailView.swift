//
//  ListView.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/29/24.
//

import SwiftUI

//struct ActivityCompleted: Codable{
//    var completedCount: Int
//}



struct DetailView: View {
    
    @State private var tapCount = ActivityCompleted(completedCount: 0)
    
    var body: some View {
        
        NavigationStack{
            
            List(0..<10){ i in
                NavigationLink("\(i)", value: i)
                
            }
            .navigationDestination(for: Int.self) { number in
                DetailSheet(number: number)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        print("Add")
                        
                    }){
                        Image(systemName: "plus")
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.blue)
                            .padding(-15)
                        
                    
                    }
                }
                
            }
            .navigationTitle("Habit-Tracking")
            .navigationBarTitleDisplayMode(.inline)
            
            
            
        }
        
                
        }
    }
#Preview {
    DetailView()
}
