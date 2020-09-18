//
//  ContentView.swift
//  WeSplit
//
//  Created by Carlos Manzanas Navia on 18/09/2020.
//  Copyright © 2020 foskon. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Rod"]
    @State private var selectedStudent = 0
    
    var body: some View {
        VStack {
            Picker("Select a student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("Selected: \(selectedStudent)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
