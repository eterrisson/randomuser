//
//  UserDetailView.swift
//  RandomUser
//
//  Created by Eric Terrisson on 16/05/2024.
//

import SwiftUI
import MapKit

struct UserDetailView: View {
    
    let user: User
    
    @State private var region: MKCoordinateRegion
        
    init(user: User) {
        self.user = user
        if let latitude = Double(user.location.coordinates.latitude), let longitude = Double(user.location.coordinates.longitude) {
            _region = State(initialValue: MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            ))
        } else {
            _region = State(initialValue: MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: 37.7879, longitude: -122.4074),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            ))
        }
    }
    
    var body: some View {
        VStack {
            // Coordinate
            HStack {
                Text("Latitude: \(user.location.coordinates.latitude), Longitude: \(user.location.coordinates.longitude)")
            }
            
            // Map
            Map(coordinateRegion: $region)
                .frame(height: 150)
            
            // Image du profil
            AsyncImage(url: URL(string: user.picture.large)) { image in
                image.resizable()
            } placeholder: {
                Color.red
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .offset(y: -50)
            
            // Data
            VStack {
                Text(user.name.description)
                    .font(.title)
                    .foregroundColor(.pink)
                HStack {
                    Image(systemName: "map.fill")
                    Text(user.location.fullAddress)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
        }
    }
}
