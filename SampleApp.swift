//
//  SampleApp.swift
//  Sample
//
//  Created by Sahil2 on 21/09/25.
//

import SwiftUI

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ContentViewModel())
        }
    }
}
