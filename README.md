# SimpleMovieSearch
A simple app done in SwiftUI which displays search results of movies to the user.

## App summary
    1. Xcode version used: 15.1, Minimum iOS deployment version is iOS 16
    2. Simulators used for testing: iPhone 15 Pro Max, iPhone 15 Pro
    3. Devices used for testing: iPhone 12 Pro, iPhone 8
    4. Frameworks: SwiftUI, Combine
    5. Dependency Manager: None
    6. Third party libraries: None
    7. Design pattern: Model-View-ViewModel (MVVM)
    8. Content is visible in dark / light modes (Press Cmd + Shift + A to toggle modes while using simulator app)

This simple app shows the user(s) a single screen which shows a simple search bar that receives input from them. A sample list of movies (pre-defined) are displayed on the screen when it first loads.

## Design pattern
Model-View-ViewModel (MVVM) architectural pattern is used for this app, where viewModel handles all business logic. 
In this case, the network call is done inside the viewModel (MovieListViewModel), data is stored inside the model classes (Movie & MovieResponse) and is accessed by the main view (MovieListView) through viewModel. 

## Frameworks
Native iOS frameworks SwiftUI (for UI rendering) and Combine (for network calls) have been used in this app. This is to demonstrate how sublime it is to use them. If can be noted how much this reduces the use of code compared to UIKit. AsyncImage capability of SwiftUI is used instead of third-party libraries to load images asynchronously.

## Code structure
    1. Model: Data model(s) that holds data (eg: Movie)
    2. View: Interacts with user and catches events (eg: MovieListView)
    3. View Model: Handles all business logic & communicate between view and model (eg: MovieListViewModel)
    4. Helpers: Extension classes for Color and Image
    5. Unit tests which take care of the simplest business logic

## Known functionality and edge case omissions
The app is designed in the simplest way without over-engineering solutions. Some of the known omissions (which can boost performance) are as follows:

    1. NSCache can be used to cache data for better performance
    2. Third-party libraries (like SDWebImage or Kingfisher that can aid in asynchronous loading and caching of images) weren't implemented here due to the simplicity of the app.
    3. Dependency managers like Swift Package Manager and Cocoapods didn't need to be used


