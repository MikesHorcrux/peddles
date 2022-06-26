//
//  MapViewModel.swift
//  peddles
//
//  Created by Mike  Van Amburg on 6/25/22.
//


import Foundation
import Combine
import CoreLocation
import SwiftUI

class MapViewModel: ObservableObject {
    @Published var state = MapState()
    
    private let client: APIClient
    private var cancellables = Set<AnyCancellable>()
    
    init(client: APIClient, state: MapState = MapState()) {
        self.client = client
        //fetchAllOrgs()
        self.state = state
    }
    
    func fetchAllOrgs() {
        client
            .dispatch(GetAllOrgs())
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else {
                    print(completion)
                    return
                }
                self?.state.error = error.identifiable
            } receiveValue: { [weak self] response in
                print(response)
            }
            .store(in: &cancellables)
    }

    func fetchOrgsInArea(zipCode: String) {
        client
            .dispatch(GetAllOrgs(queryParams:
                                    [
                                        "location": "78653"
                                    ]))
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard case .failure(let error) = completion else {
                    print(completion)
                    return
                }
                self?.state.error = error.identifiable
            } receiveValue: { [weak self] response in
                self?.state.organizations = response
                
                var location = CLLocationCoordinate2D()
                var annotation: [AnnotationModel] = [ ]
                for org in response.organizations {
                    
                    let address = (org.address.address1 ?? "") + " " + (org.address.address2 ?? "") + " " + "\(org.address.city) \(org.address.state) \(org.address.postcode) "
                   
                    self?.getCoordinate(addressString: address, completionHandler: { local, error in
                        location = local
                        print(location)
                        print(AnnotationModel(id: org.id, img: org.photos?.first?.small ?? "", lat: location.latitude, long: location.longitude))
                        annotation.append(AnnotationModel(id: org.id, img: org.photos?.first?.small ?? "", lat: location.latitude, long: location.longitude))
                        print(annotation)
                    })
                    
                    
                }
                self?.state.organizationAnnotations.append(contentsOf: annotation)
            }
            .store(in: &cancellables)
    }

    func getCoordinate( addressString : String,
            completionHandler: @escaping(CLLocationCoordinate2D, NSError?) -> Void ) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0] {
                    let location = placemark.location!
                        
                    completionHandler(location.coordinate, nil)
                    return
                }
            }
                
            completionHandler(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
}
