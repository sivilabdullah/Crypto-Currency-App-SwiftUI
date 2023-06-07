//
//  ContentView.swift
//  Crypto Currency App SwiftUI
//
//  Created by abdullah's Ventura on 7.06.2023.
//

import SwiftUI

struct CoinView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView()
    }
}
