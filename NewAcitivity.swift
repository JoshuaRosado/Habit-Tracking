//
//  NewAcitivity.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/28/24.
//

import SwiftUI

struct NewActivity: View {
    @State private var title : String = ""
    @State private var description: String = ""
    
    var body: some View {
        VStack{
            NavigationStack{
                Form{
                    VStack{
                        TextField("Title", text:  $title)
                        TextField("Description", text: $description)
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing){
                            Button(action: {
                                print("Add")
                            }){
                                Text("Create")
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.blue)
                                    .padding(-15)
                                
                            
                            }
                        }
                        
                        ToolbarItem(placement: .topBarLeading){
                            Button("Cancel",action: {
                                print("Cancel")
                            })
                            .padding(5)
                        }
                    }

                    
                    
                }
                .navigationTitle("New activity")
                .navigationBarTitleDisplayMode(.inline)
                
            }
            
        }
        
    }
    
}

#Preview {
    NewActivity()
}
