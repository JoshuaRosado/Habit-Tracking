//
//  ListView.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/29/24.
//

import SwiftUI

struct ActivityCompleted: Codable{
    var completedCount: Int
}

struct DetailView: View {
    
    @State private var tapCount = ActivityCompleted(completedCount: 0)
    
    var body: some View {
        
        NavigationStack{
            List(0..<10){ i in
                    
                    NavigationLink(" \(i)",value: i)
                }
                .navigationDestination(for: Int.self) { number in
                    VStack{
                        Spacer()
                        Text("Description of \(number)")
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
