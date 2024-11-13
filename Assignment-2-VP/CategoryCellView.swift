//
//  CategoryCellView.swift
//  Assignment-2-VP
//
//  Created by Vishwas Sharma on 13/11/24.
//

import SwiftUI

struct CategoryCellView: View {
    let width: CGFloat
    let height: CGFloat
    let text: String
    let iconText: String
    var body: some View {
        ZStack(alignment: .leading){
            Group{
                HStack{
                    ZStack(alignment: .trailing){
                        RoundedRectangle(cornerRadius: 60)
                            .foregroundStyle(.black)
                            .frame(width: (3 + width + 0.08 * sizeToFloat(calculateTextWidth(for: text)) + 5), height: height + 10)
                        
                        
                        Text(text)
                            .bold()
                            .foregroundStyle(.white)
                            .padding(.trailing, 5)
                        
                    }
                    
                }
                
                ZStack{
                    Circle()
                        .foregroundStyle(.white)
                        .frame(width: width, height: height)
                        .padding(.leading, 3.75)
                    
                    Text(iconText)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
                
                

            }
        }
        
    }
    func calculateTextWidth(for text: String) -> CGSize {
        return text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 14)])
    }
    
    func sizeToFloat(_ size: CGSize) -> CGFloat {
        return size.width * size.height
    }
}

#Preview {
    CategoryCellView(width: 100, height: 100, text: "dfaewfaew", iconText: "💀")
}
