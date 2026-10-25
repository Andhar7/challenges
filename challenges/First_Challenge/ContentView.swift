//
//  ContentView.swift
//  challenges
//
//  Created by Solver on 24.10.2026.
//

import SwiftUI

struct ContentView: View {
    
    var gradient = LinearGradient(colors: .init([ Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .bottom, endPoint: .top)
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack(alignment: .top){
             

                VStack(alignment: .leading, spacing: 5){
                    Text("ANDREA")
                        .font(.system(.title, design: .serif, weight: .heavy))
                    
                    Text("3100 Mile Race")
                        .font(.system(.title, design: .serif, weight: .light))
                        
                }
                .kerning(3)
                
                Spacer()
                
                Image(systemName: "trophy.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                    .shadow(color:  Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), radius: 5)
            }
            .frame(width: 350)
            
            Spacer()
            
            Image(.winner)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150, alignment: .center)
                .cornerRadius(15)
                .overlay {
                    RoundedRectangle(cornerRadius: 13) 
                        .stroke(Color(.yellow), lineWidth: 3)
                        .shadow(color:  Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 5)
                }
                .padding(55)
                .overlay {
                    Circle()
                        .stroke(gradient, lineWidth: 3)
                }
            
            Spacer()
            
            HStack {
                CardsView(name: "figure.run", colour_sf:  Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)), first_text: "7", second_text: "wins", stroke_card: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)))
                
                CardsView(name: "27.calendar", colour_sf: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), first_text: "42", second_text: "days", stroke_card: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                
                CardsView(name: "medal", colour_sf: Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), first_text: "81", second_text: "miles/day", stroke_card: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
            }
            
            Spacer()
            
            Text("Self-Transcendence gives us\njoy in boundless measure.")
                .font(.system(size: 24, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .kerning(3)
            
            
            Spacer()
        }
        .foregroundStyle(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            LinearGradient(gradient: .init(colors: [ Color(#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)), Color(#colorLiteral(red: 0.008772685266, green: 0, blue: 0.02698108495, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}

extension ContentView {
    
    @ViewBuilder
    func CardsView(name: String, colour_sf: Color, first_text: String, second_text: String, stroke_card: Color) -> some View {
        
        VStack(spacing: 24) {
            Image(systemName: name)
                .font(.system(size: 33, weight: .heavy))
                .foregroundStyle(colour_sf)
            VStack(spacing: 3) {
                Text(first_text)
                Text(second_text)
            }
            .font(.system(size: 21, weight: .bold, design: .serif))
            .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, minHeight: 180)
        .background(.ultraThinMaterial, in: .rect(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(stroke_card, lineWidth: 2)
        }
        
      /*  RoundedRectangle(cornerRadius: 12.0)
            .frame(width: 130, height: 180)
            .background(.ultraThinMaterial, in: .ellipse)
            .overlay(alignment: .center) {
                VStack(spacing: 33){
                    Image(systemName: name)
                        .font(.system(size: 33, weight: .heavy, design: .serif))
                        .foregroundStyle(colour_sf)
                    VStack(spacing: 3){
                        Text(first_text)
                        Text(second_text)
                    }
                    .font(.system(size: 21, weight: .bold, design: .serif))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .kerning(1)
                    .shadow(color:  Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 1.2)
                }
                .foregroundStyle(.black)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 13)
                    .stroke(stroke_card, lineWidth: 2)
                    .shadow(color:  Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 5)
            }
        */
    }
}
