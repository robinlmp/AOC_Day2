//
//  ContentView.swift
//  AOC_Day2
//
//  Created by Robin Phillips on 02/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Text")
            .onAppear {
                print("\(loadFile(fileName: "input-2") ?? [""])")
            }
    }
    
    func loadFile(fileName: String) -> [String]? {
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: "txt"),
              let contents = try? String(contentsOfFile: filepath) else { return nil }
        
        let returnArray = contents.components(separatedBy: "\n").filter { $0 != "" }
        
        print(returnArray.count)
        return returnArray
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
