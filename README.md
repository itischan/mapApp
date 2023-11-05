# mapApp



![Screen%20Recording%202023-11-05%20at%203 35 12%20PM](https://github.com/itischan/mapApp/assets/136856772/f9a28678-643d-4b6e-840a-af7c9725cfb4)
#SwiftUI view (LocationsView):
*Responsible for displaying the map and location details.
LocationsView uses the LocationsViewModel for data and behavior.
LocationsView displays the map and location details using a ZStack.
Tapping on a location pin opens a detail view using a sheet.
LocationsViewModel manages data and logic for the view.
It stores a list of locations.
Manages the current map location and updates the map region.
Handles user interactions to show or hide the location list and open the detail view.
Initializes the map region based on the first location.
Uses LocationsDataService to load location data.
How to Use MapApp:
Open the LocationsView in your SwiftUI project.
Initialize a LocationsViewModel and set it as an environment object for the LocationsView.
Run the application to view the map with location pins.
Dependencies:
SwiftUI: Framework for building user interfaces.
MapKit: Framework for integrating maps and location services.
