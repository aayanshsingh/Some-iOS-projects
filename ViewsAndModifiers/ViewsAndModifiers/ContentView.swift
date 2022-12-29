//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by aayansh singh on 29/12/22.
//

import SwiftUI

struct Title: ViewModifier {                // 6) * Custom modifiers
                                            // Watch this lecture again: https://www.hackingwithswift.com/books/ios-swiftui/custom-modifiers
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct CapsuleText: View {  // 5) SwiftUI lets us break complex views down into smaller views without incurring much if any performance impact. This means that we can split up one large view into multiple smaller views, and SwiftUI takes care of reassembling them for us.
    
    var text: String             // Also this is the first time we are using multiple structs.
                                
    var body: some View {       // Apart from the 1st mentioned use, it also increases reusiblity.
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    
    @State var toggleEx = false  // SWIFTUI automatically watches all its @State property, it'll reinvoke the body property whenever @State property changes.
    
    let motto1 = Text("Draco dormiens") // 1) using views as properties.
    let motto2 = Text("nunquam titillandus")
    
    @ViewBuilder var spells: some View {    // 2) to accomodate multiple views as properties
                                // same as var body where it wraps the views and returns them as a tuple.
        Text("Lumos")
        Text("Obliviate")
    }
    
    var spells2: some View {
        Group {                     // gp is a bundling command just like vstack/Hstack.
            Text("Lumos2")
            Text("Obliviate2")
        }
    }

    var body: some View {
        VStack{
            spells
            
            spells2
            
            motto1
                .foregroundColor(.blue)
            motto2
            
            Button("Hello World!"){
                toggleEx.toggle()
            }
            .foregroundColor(toggleEx ? .red : .green) // 3) ternary operational operator.
            
            VStack {
                Text ("Gryffindor")
                    .font (.largeTitle) // child modifier overwrites parent modifier.
                Text ("Hufflepuff")
                Text ("Ravenclaw")
                Text ("Slytherin")
            }
            .font(.title) // 4) This single modifier for all View is called Environment modifiers.
            
            VStack (spacing: 10) {
                CapsuleText(text: "First")
                    .foregroundColor(.green)
                CapsuleText(text: "Second")
                    .foregroundColor(.yellow)
            }
            
            Text("Hello World")
                .titleStyle()
            Text("Hello World")
                .modifier(Title())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
