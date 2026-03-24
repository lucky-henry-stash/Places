import SwiftUI

struct AddPlaceView: View {
    @Environment(\.dismiss) private var dismiss
    
    var onAdd: (Place) -> Void
    
    var validator = FormValidator()
    
    var longitudeErrorMessage: String? {
        validator.validateCoordinate(long, coordinateType: .longitude)?.errorDescription
    }
    
    var latitudeErrorMessage: String? {
        validator.validateCoordinate(lat, coordinateType: .latitude)?.localizedDescription
    }
    @State private var name: String = ""
    @State private var lat: String = ""
    @State private var long: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("New Place")) {
                    TextField("Name", text: $name)
                    VStack(alignment: .leading){
                        TextField("Latitude", text: $lat)
                            .keyboardType(.decimalPad)
                        if let latitudeErrorMessage {
                            Text(latitudeErrorMessage)
                        }
                    }
                    VStack(alignment: .leading){
                        TextField("Longitude", text: $long)
                            .keyboardType(.decimalPad)
                        if let longitudeErrorMessage {
                            Text(longitudeErrorMessage)
                        }
                    }

                    
                }
            }
            .navigationTitle("Add New Place")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addPlace()
                    }.disabled(!isValid())
                }
            }
        }
    }
    
    func isValid() -> Bool{
        return latitudeErrorMessage?.isEmpty == true && longitudeErrorMessage?.isEmpty == true
    }
    
    func addPlace() {
        guard let latitude = Double(lat),
              let longitude = Double(long) else { return }
        
        let newPlace = Place(
            name: name.isEmpty ? nil : name,
            lat: latitude,
            long: longitude
        )
        
        onAdd(newPlace)
        dismiss()
    }
}
