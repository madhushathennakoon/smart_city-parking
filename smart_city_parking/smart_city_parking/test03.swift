import SwiftUI
import MapKit


extension MKPointAnnotation: Identifiable {
    public var id: UUID {
        return UUID()
    }
}

struct Explore: View {
    
    
    let colombo = MKPointAnnotation()
    let kandy = MKPointAnnotation()
    
    
    let lotusTower = MKPointAnnotation()
    let galleFace = MKPointAnnotation()
    let independenceSquare = MKPointAnnotation()
    let colomboFort = MKPointAnnotation()

   
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.9271, longitude: 79.8612),
        span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
    )
    
    init() {
        
        colombo.title = "Colombo"
        colombo.coordinate = CLLocationCoordinate2D(latitude: 6.906288910788824, longitude: 79.87086619716021)
        
        kandy.title = "Kandy"
        kandy.coordinate = CLLocationCoordinate2D(latitude: 6.906061306524888, longitude: 79.86933551883689)
        
        
        lotusTower.title = "Lotus Tower"
        lotusTower.coordinate = CLLocationCoordinate2D(latitude: 6.9270, longitude: 79.9772)
        
        galleFace.title = "Galle Face"
        galleFace.coordinate = CLLocationCoordinate2D(latitude: 6.9276, longitude: 79.8560)
        
        independenceSquare.title = "Independence Square"
        independenceSquare.coordinate = CLLocationCoordinate2D(latitude: 6.9272, longitude: 79.9748)
        
        colomboFort.title = "Colombo Fort"
        colomboFort.coordinate = CLLocationCoordinate2D(latitude: 6.9366, longitude: 79.8487)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: [colombo, kandy, lotusTower, galleFace, independenceSquare, colomboFort]) { location in
                    MapPin(coordinate: location.coordinate, tint: .red)
                }
                .edgesIgnoringSafeArea(.all)
                
            }
        }
    }
}

#Preview {
    Explore()
}
