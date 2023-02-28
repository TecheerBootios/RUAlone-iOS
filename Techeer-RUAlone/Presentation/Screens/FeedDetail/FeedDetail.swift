//
//  FeedDetailView.swift
//  Techeer-RUAlone
//
//  Created by Sean Hong on 2022/12/28.
//

import SwiftUI
import MapKit

struct FeedDetail: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ViewModel
    @State private var isPresented = true
    @State private var isChatPresented = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                mapView()
                    .edgesIgnoringSafeArea(.all)
                    .sheet(isPresented: $isPresented) {
                        modalView().presentationDetents([.medium, .large])
                    }
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

// MARK: Displaying Modal
private extension FeedDetail {
    func modalView() -> some View {
        NavigationStack {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    titleView()
                    uploadTimeView()
                    joinButtonView()
                }.padding([.top, .leading, .trailing])
                
                List {
                    basicInfoSectionView()
                    routeInfoSectionView()
                }
            }
        }
    }
    
    func titleView() -> some View {
        HStack {
            Text("\(viewModel.detail.title)").font(.title).bold()
            Spacer()
            ZStack {
                Image(systemName: "x.circle.fill").foregroundColor(.gray)
            }.onTapGesture {
                isPresented.toggle()
            }
        }
    }
    
    func uploadTimeView() -> some View {
        Label(title: {
            Text("Time \(Int(viewModel.detail.startAt.timeIntervalSinceNow / 3600))").font(.subheadline)
        }, icon: {
            Image(systemName: "clock.fill")
        }).foregroundColor(Color.gray)
    }
    
    func joinButtonView() -> some View {
        Button(action: {
            isChatPresented.toggle()
        }, label: {
            Label(title: {
                Spacer()
                Text("Join")
                    .font(.title3)
                Spacer()
            }, icon: { Image(systemName: "car.fill") })
        })
        .tint(.customOrange)
        .buttonStyle(.borderedProminent)
        .fullScreenCover(isPresented: $isChatPresented) {
            ChatView(channelURL: viewModel.detail.chatURL)
        }
    }
    
    func basicInfoSectionView() -> some View {
        Section {
            Text("\(viewModel.detail.startAt.formatted(date: .abbreviated, time: .shortened))").bold()
            Text("Gathered State \(3) \(viewModel.detail.limitMember)")
                .foregroundColor(.red)
                .bold()
        } header: {
            Text("Gather Time").font(.subheadline).foregroundColor(.gray)
        }
    }
    
    func routeInfoSectionView() -> some View {
        Section {
            Label(title: { Text("Find Route") }, icon: { Image(systemName: "map") })
                .onTapGesture { }
        }
    }
}

private extension FeedDetail {
    func mapView() -> some View {
        Map(coordinateRegion: $viewModel.region, interactionModes: .zoom, annotationItems: [viewModel.place]) { place in
            MapAnnotation(coordinate: place.location!) {
                Button(action: { isPresented.toggle() }, label: {
                    Image(systemName: "fork.knife.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.customOrange)
                })
            }
        }
    }
}
