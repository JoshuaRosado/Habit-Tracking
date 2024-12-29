//
//  NewAcitivity.swift
//  Habit-Tracking
//
//  Created by Joshua Rosado Olivencia on 12/28/24.
//

import SwiftUI

struct NewAcitivity: View {
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
                    .toolbar{
                            Button(action: {
                                print("hello")
                            }){
                                Image(systemName: "plus")
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.blue)
                                    
                                
                            }

                    }

                    
                    
                }
                .navigationTitle("Add activity")
                
            }
            
        }
        
    }
    
}

#Preview {
    NewAcitivity()
}
