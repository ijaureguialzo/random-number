//
//  ContentView.swift
//  RandomNumber
//
//  Created by Ion Jaureguialzo Sarasola on 15/2/21.
//

import SwiftUI

struct ContentView: View {

    @State private var numero = 0
    @State private var digitos = 1

    let minDigitos = 1
    let maxDigitos = 16

    var body: some View {

        VStack {

            Text(String(format: "%ld", locale: Locale.current, numero))
                .padding(30)
                .frame(width: 300, height: 300, alignment: .center)
                .background(Color("AccentColor"))
                .clipShape(Circle())
                .foregroundColor(Color.white)
                .font(.system(size: 200))
                .minimumScaleFactor(0.0001)
                .lineLimit(1)
                .padding()
                .onChange(of: digitos) { _ in
                aleatorio()
            }

            Stepper("Dígitos", value: $digitos, in: minDigitos...maxDigitos)
                .labelsHidden()
                .padding()

            Button(action: {
                aleatorio()
            }) {
                Image(systemName: "forward.fill")
                    .font(.title)
            }.padding()

        }.onAppear() {
            aleatorio()
        }
    }

    func aleatorio() {

        var aleatorio = 0

        repeat {
            aleatorio = Int.random(in: Int(pow(Double(10), Double(digitos - 1)))..<Int(pow(Double(10), Double(digitos))))
        } while aleatorio == numero

        numero = aleatorio
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
