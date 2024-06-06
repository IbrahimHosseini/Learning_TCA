//
//  ContentView.swift
//  Learning_TCA
//
//  Created by Ibrahim on 6/5/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var state: AppState
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: CounterView(state: state)) {
                    Text("Counter View")
                }
                
                NavigationLink(destination: EmptyView()) {
                         Text("Favorite primes")
                }
            }
            .navigationBarTitle("State management")
        }
    }
}

#Preview {
    ContentView(state: AppState())
}

class AppState: ObservableObject {
    @Published var count: Int = 0
}

struct CounterView: View {
    
    @ObservedObject var state: AppState
    
    private func ordinal(_ n: Int) -> String {
      let formatter = NumberFormatter()
      formatter.numberStyle = .ordinal
      return formatter.string(for: n) ?? ""
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    state.count -= 1
                }) {
                    Text("-")
                }
                Text("\(state.count)")
                Button(action: {
                    state.count += 1
                }) {
                    Text("+")
                }
            }
            
            Button(action: {}) {
                Text("Is this prime?")
            }
            Button(action: {}) {
                Text("What is the \(self.ordinal(state.count)) prime?")
            }
        }
        .font(.title)
        .navigationTitle("Counter Demo")
    }
}
