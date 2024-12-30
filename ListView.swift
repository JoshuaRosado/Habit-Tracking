//
//  ListView.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/29/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        NavigationStack{
            List(0..<10){ i in
                    
                    NavigationLink(" \(i)",value: i)
                        
                        
                    
                    
                }
                .navigationDestination(for: Int.self) { number in
                    Text("Description of \(number)")
                
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
