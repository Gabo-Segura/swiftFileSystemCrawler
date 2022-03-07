//
//  main.swift
//  Mini-Project-1
//
//  Created by Gabo on 3/4/22.
//  Copyright © 2022 Gabo. All rights reserved.
//

import Foundation

print("Structure Folder + Files")
print()
var directoryCount : Int = 0
var fileCount : Int = 0

func spider (at url: URL, symbol: String = "") -> Bool {
    var leftDraw = symbol
    let fileManager = FileManager.default
    let files = try? fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
    
    for eachFile in files! {
        func fileSymbols(symbolOne: String, symbolTwo: String){
            while let lastFile = files?.last {
                if lastFile == eachFile {
                    leftDraw = symbol + symbolOne
                } else{
                    leftDraw = symbol + symbolTwo
                }
                break
            }
        }
        fileSymbols(symbolOne: " └─ ", symbolTwo: " ├─ ")
        print(leftDraw + eachFile.lastPathComponent)
        while (eachFile.hasDirectoryPath){
            directoryCount += 1
            fileSymbols(symbolOne: "    ", symbolTwo: " │  ")
            spider(at: eachFile, symbol: leftDraw)
            break
        }
        fileCount += 1
    }
    return (files != nil)
}

spider(at: URL.init(string: "/Users/gabo/Documents/WMAD/AGDS/Homework/swiftFileSystemCrawler")!)
print()
print(String(directoryCount) + " directories, " + String(fileCount), " files")

