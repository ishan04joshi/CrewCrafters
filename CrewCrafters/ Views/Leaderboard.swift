//
//  Leaderboard.swift
//  CrewCrafters
//
//  Created by user1 on 09/12/23.
//

import SwiftUI

struct Leaderboard: View {
    @ObservedObject var viewModel = LeaderboardViewModel()
    var body: some View {
        ScrollView{
            VStack(spacing: 0) {
                HStack(spacing: 30){
                    VStack{
                        ZStack{
                            Image("user")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90)
                                .clipShape(Circle())
                                .background(
                                    Circle()
                                        .stroke(.blue, lineWidth: 5)
                                        .padding(-2)
                                )
                            ZStack{
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                                Text("2")
                                    .foregroundColor(.white)
                            }
                            .offset(y: 50)
                        }
                        .offset(y: 30)
                        .padding(.bottom, 50)
                        Text("User 2")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        HStack(spacing: 0){
                            Image(systemName: "dumbbell.fill")
                                .foregroundColor(.blue)
                                .font(.caption)
                                .rotationEffect(.degrees(140))
                            Text("40 pts")
                                .font(.footnote)
                        }
                    }
                    VStack{
                        ZStack{
                            Image(systemName: "crown.fill")
                                .font(.largeTitle)
                                .foregroundColor(.blue)
                                .offset(y: -60)
                            Image("user")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .background(
                                    Circle()
                                        .stroke(.blue, lineWidth: 5)
                                        .padding(-2)
                                )
                            ZStack{
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                                Text("1")
                                    .foregroundColor(.white)
                            }
                            .offset(y: 55)
                        }
                        .padding(.bottom, 20)
                        Text("User 1")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        HStack(spacing: 0){
                            Image(systemName: "dumbbell.fill")
                                .foregroundColor(.blue)
                                .font(.caption)
                                .rotationEffect(.degrees(140))
                            Text("43 pts")
                                .font(.footnote)
                        }
                    }
                    VStack{
                        ZStack{
                            Image("user")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90)
                                .clipShape(Circle())
                                .background(
                                    Circle()
                                        .stroke(.blue, lineWidth: 5)
                                        .padding(-2)
                                )
                            ZStack{
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                                Text("3")
                                    .foregroundColor(.white)
                            }
                            .offset(y: 50)
                        }
                        .offset(y: 30)
                        .padding(.bottom, 50)
                        Text("User 3")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        HStack(spacing: 0){
                            Image(systemName: "dumbbell.fill")
                                .foregroundColor(.blue)
                                .font(.caption)
                                .rotationEffect(.degrees(140))
                            Text("38 pts")
                                .font(.footnote)
                        }
                    }
                }
                .padding(.all, 20)
                
                List {
                    ForEach(viewModel.items) {item in
                            HStack {
                                Text("\(item.count)")
                                    .font(.subheadline)
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50)
                                    .clipShape(Circle())
                                    .padding(.horizontal)
                                Text(item.username)
                                    .font(.subheadline)
                                    .lineLimit(1)
                                Spacer()
                                Text("\(item.points) pts")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .padding(.horizontal)
                        }
                        .listRowSeparator(.hidden)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 25, bottom: 10, trailing: 10))
                }
                .padding([.top, .leading, .trailing])
                .frame(height: 550)
                .listStyle(.plain)
                .scrollDisabled(true)
            }
        }
        .navigationTitle("LeaderBoard")
        .padding(7)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
}


#Preview {
    Leaderboard()
}
