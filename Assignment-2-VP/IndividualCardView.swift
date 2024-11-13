//
//  IndividualCardView.swift
//  Assignment-2-VP
//
//  Created by Vishwas Sharma on 12/11/24.
//

import SwiftUI

struct IndividualCardView: View {
    var imageName: String
    var cardWidthRatio: CGFloat = 0.75
    var cardHeightRatio: CGFloat = 0.8
    var cornerRadius: CGFloat = 26
    var shadowRadius: CGFloat = 5
    var borderWidth: CGFloat = 4
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.black)
                    .shadow(radius: shadowRadius)
                
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width * cardWidthRatio, height: geo.size.width * cardHeightRatio)
                    .clipped()
                    .mask(
                        RoundedRectangle(cornerRadius: cornerRadius)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(Color.white, lineWidth: borderWidth)
                    )
                
                VStack{
                    HStack{
                        Text("Next").foregroundStyle(.white)
                            .font(.title2)
                        Text("HIIT Session")
                            .foregroundStyle(.white)
                            .bold()
                            .font(.title2)
                    }
                    .padding(.top, 20)
                    
                    Text("A Fit life is great life")
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .offset(CGSize(width: -10, height: 0))
                }
                .offset(CGSize(width: -30, height: 50))
                
                Button(action: {
                    // Hmove to next screen
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.white)
                            .frame(width: 120, height: 40)
                            .offset(CGSize(width: -70, height: 120))
                        
                        RoundedRectangle(cornerRadius: 18)
                            .fill(Color.black.opacity(0.8))
                            .frame(width: 117, height: 38)
                            .offset(CGSize(width: -70, height: 120))
                        
                        Text("📗 CONTINUE")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .bold))
                            .offset(CGSize(width: -70, height: 120))
                    }
                }
            }
            .frame(width: geo.size.width * cardWidthRatio, height: geo.size.width * cardHeightRatio)
            .padding()
        }
    }
}

#Preview {
    IndividualCardView(imageName: "gym1")
}
