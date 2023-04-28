//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Joao Barros on 23/04/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = MemoryController()
    
    var body: some Scene {
        WindowGroup {
            MemoryView(controller: game)
        }
    }
}
