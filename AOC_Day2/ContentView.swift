//
//  ContentView.swift
//  AOC_Day2
//
//  Created by Robin Phillips on 02/12/2021.
//

import SwiftUI

let example = """
forward 5
down 5
forward 8
up 3
down 8
forward 2
"""
// answer for this should be 900

enum Part {
    case part1, part2
}

struct ContentView: View {
    var body: some View {
        Text("Part 1 = \(directionAndDistanceTotals(fileName: "input-2", part: .part1))")
        Text("Part 2 = \(directionAndDistanceTotals(fileName: "input-2", part: .part2))")
    }
    
    func loadFile(fileName: String) -> String? {
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: "txt"),
              let contents = try? String(contentsOfFile: filepath) else { return nil }
        return contents
    }
    
    func processFile(contents: String) -> [String] {
        return contents.components(separatedBy: "\n").filter { $0 != "" }
    }
    
    func directionAndDistanceTotals(fileName: String, part: Part) -> Int {
        guard let contents = loadFile(fileName: fileName) else { return 0}
        let movements = processFile(contents: contents)

        var x = 0
        var y = 0
        var aim = 0

        for move in movements {
            guard let processedMove = splitString(input: move) else { continue }
            if processedMove.0 == "forward" {
                x += processedMove.1
                if part == .part2 { y += processedMove.1 * aim }
            } else if processedMove.0 == "up" || processedMove.0 == "down" {
                switch part {
                case .part1:
                    y += processedMove.1
                case .part2:
                    aim += processedMove.1
                }
                
            }
        }
        print(x * y)
        return x * y
    }
    
    func splitString(input: String) -> (String, Int)? {
        let components = input.components(separatedBy: " ")
        guard var distance = Int(components[1]) else { return nil }
        if components[0].hasPrefix("u") || components[0].hasPrefix("U") { distance = 0 - distance }
        return (components[0], distance)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
