//
//  FeedDetailModalView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/28.
//

import SwiftUI

struct FeedDetailModalView: View {
    @Environment(\.dismiss) var dismiss
    @State private var binding = false
    let details: FeedDetailModel
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(details.title)").font(.title).bold()
                            Spacer()
                            ZStack {
                                Image(systemName: "x.circle.fill").foregroundColor(.gray)
                            }.onTapGesture {
                                dismiss()
                            }
                        }
                        
                        Label(title: {
                            Text("\(details.timestamp) 시간 전")
                                .font(.subheadline)},
                              icon: {Image(systemName: "clock.fill")})
                        .foregroundColor(Color.gray)
                        
                        HStack {
                            Button(action: {
                                binding.toggle()
                            }, label: {
                                Label(title: {Text("참여하기")}, icon: {
                                    Image(systemName: "car.fill")})
                                .frame(width: geometry.size.width/1.4, height: geometry.size.width/13)
                            })
                            .tint(.customOrange)
                            .buttonStyle(.borderedProminent)
                            .fullScreenCover(isPresented: $binding) {
                                ChatView(channelURL: details.chatURLString)
                            }
                            
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "ellipsis")
                                .foregroundColor(.customOrange)
                                .frame(height: geometry.size.width/13)
                            })
                            .buttonStyle(.bordered)
                        }
                    }.padding()
                    
                    List {
                        VStack(alignment: .leading) {
                            Text("만남 시간")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Text("\(details.startAt)")
                                .bold()
                            Text("\(details.currentMemeber) / \(details.limitMember) 명 모집중")
                                .foregroundColor(.red)
                                .bold()
                        }
                        Section {
                            HStack {
                                Label(title: {Text("경로보기")},
                                      icon: { Image(systemName: "map") })
                            }
                            .contentShape(Rectangle())
                            .onTapGesture {
                                
                            }
                        }.listStyle(.sidebar)
                    }
                }
            }
        }
        
    }
}
