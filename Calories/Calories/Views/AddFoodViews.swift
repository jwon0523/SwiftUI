//
//  AddFoodViews.swift
//  Calories
//
//  Created by jaewon Lee on 5/10/24.
//

import SwiftUI

struct AddFoodViews: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("Food name", text: $name)
                
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button(action: {
                        DataController().addFood(
                            name: name,
                            calories: calories,
                            context: managedObjContext
                        )
                        dismiss()
                    }, label: {
                        Text("Submit")
                    })
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AddFoodViews()
}
