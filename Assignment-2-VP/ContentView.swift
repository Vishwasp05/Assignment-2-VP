//
//  ContentView.swift
//  Assignment-2-VP
//
//  Created by Vishwas Sharma on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    
    let categoryItems: [CategoryItem] = [
        CategoryItem(width: 50, height: 50, text: "", iconText: "All"),
        CategoryItem(width: 50, height: 50, text: "Strength", iconText: "🏋️‍♀️"),
        CategoryItem(width: 50, height: 50, text: "Yoga", iconText: "🧘‍♀️"),
        CategoryItem(width: 50, height: 50, text: "Cycling", iconText: "🚴‍♂️"),
        CategoryItem(width: 50, height: 50, text: "Swimming", iconText: "🏊‍♂️"),
        CategoryItem(width: 50, height: 50, text: "HIIT", iconText: "🔥"),
        CategoryItem(width: 50, height: 50, text: "Pilates", iconText: "🤸‍♀️"),
        CategoryItem(width: 50, height: 50, text: "Walking", iconText: "🚶‍♂️"),
        CategoryItem(width: 50, height: 50, text: "Stretching", iconText: "🤸‍♂️"),
        CategoryItem(width: 50, height: 50, text: "Meditation", iconText: "🧘‍♂️")
    ]
    
    @State private var categoryTitle: String = "Nothing"
    @State private var categoryIconText: String = "💀"
    var body: some View {
            GeometryReader { geo in
                ZStack {
                    // Bg
                    Color.black.opacity(0.8)
                        .offset(CGSize(width: 0, height: -geo.size.height * 0.575))
                        .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        // Header
                        VStack(alignment: .leading) {
                            Text("Fitness Courses")
                                .foregroundStyle(.white)
                                .font(.system(size: 30))
                                .bold()
                                .kerning(1.5)
                            
                            Text("Your Active Lessons")
                                .foregroundStyle(.white)
                                .font(.system(size: 18))
                                .bold()
                                .kerning(1.5)
                                .padding(.top, 10)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .leading], 20)
                        

                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: -80){
                                ForEach(0..<5, id: \.self){ index in
                                    IndividualCardView(imageName: "gym1")
                                        .frame(width: geo.size.width)
                                }
                            }
                        }
                        .frame(height: 350)
                        .padding(.top, 20)
                        
                    
                        VStack(spacing: 8) {
                            HStack {
                                Text("Categories")
                                    .font(.title)
                                    .bold()
                                Spacer()
                            }
                            .padding(.leading, 15)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 5) {
                                    ForEach(categoryItems) { item in
                                        Button {
                                            categoryTitle = item.text
                                            categoryIconText = item.iconText
                                        } label: {
                                            CategoryCellView(width: item.width, height: item.height, text: item.text, iconText: item.iconText)
                                        }
                                    }
                                }
                            }
                            .padding(.leading, 15)
                            .padding(.bottom, 70)
                            
                            Text("\(categoryTitle) \(categoryIconText) selected")
                                .foregroundStyle(.gray)
                                .font(.largeTitle)
                                .bold()
                                .padding(.bottom, 50)
                        }
                        .padding(.top, 10)
                        
                        Spacer()
                    }
                }
            }
        }
}
#Preview {
    ContentView()
}


struct CategoryItem: Identifiable {
    let id = UUID()
    let width: CGFloat
    let height: CGFloat
    let text: String
    let iconText: String
}
