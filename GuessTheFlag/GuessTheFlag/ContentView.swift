//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by RegulusSpica1 on 24/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var count = 0
    @State var showScore = false
    @State var scoreTitle = ""
    @State var countries = ["Estonia", "France","Poland","Germany", "Ireland", "Italy", "Nigeria","Russia", "Spain", "UK","US" ].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack{
            RadialGradient (stops: [
            .init (color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.22),
            .init (color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.225)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea ( )
            
            VStack(spacing: 30){
                VStack{
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }
                    ForEach(0..<3){ nos in
                        Button{
                            check(nos)
                        } label: {
                            Image(countries[nos])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                        }
                    }
            }
        }.ignoresSafeArea()
            .alert(scoreTitle ,isPresented: $showScore){
                Button("Cancel", action: shuffle)
            }message: {
                Text("Your score is:", String(count))
            }
    }
    func check(_ nos: Int){
        if (nos == correctAnswer){
            scoreTitle = "Correct"
            count = count+1

        }
        else{
            scoreTitle = "Wrong"
        }
        showScore = true
        }
    func shuffle() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
