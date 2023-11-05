# mapApp

![Screen%20Recording%202023-11-05%20at%203 35 12%20PM](https://github.com/itischan/mapApp/assets/136856772/f9a28678-643d-4b6e-840a-af7c9725cfb4)




The code consists of a SwiftUI view called LocationsView, which serves as the main interface for displaying map and location details. This view relies on the LocationsViewModel to handle data and functionality. Locations are presented on the screen using a ZStack, and when a user taps on a location pin, it triggers the display of a detailed view via a sheet. The LocationsViewModel is responsible for managing the underlying data and logic for the view, including the storage of a list of locations. It also loads location data through the LocationsDataService. To use the MapApp, you simply need to open the LocationsView in your SwiftUI project, create an instance of the LocationsViewModel, and set it as an environment object for the LocationsView. By doing so, you can run the application and experience the map with location pins. The project relies on two key dependencies: SwiftUI, which is a framework for constructing user interfaces, and MapKit, which provides the necessary tools for integrating maps and location services into the app.
