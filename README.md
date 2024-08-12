# Flutter Weather App

## Description
The Flutter Weather App allows users to search for weather information for specific locations. It displays current weather details such as temperature, condition, wind speed, and rain probability. Additionally, it provides a daily weather forecast in a visually appealing horizontal layout. The app uses a gradient background that changes based on the weather condition.

## Features
- **Search for Weather:** Users can search for weather information for specific locations.
- **Current Weather Details:** Displays temperature, weather condition, wind speed, and rain probability.
- **Daily Weather Forecast:** Provides a daily weather forecast in a horizontal layout.
- **Dynamic Background:** Changes background gradient based on weather condition (clear, rainy, etc.).
- **Custom Fonts and Icons:** Uses Google Fonts and FontAwesome icons for an enhanced UI.

## Screenshots

<img src="https://github.com/user-attachments/assets/e3a20daa-ff12-4152-8b88-fcf466ee6c19" alt="1st Screenshot" width="250"/>
<img src="https://github.com/user-attachments/assets/0de68b3d-f576-4c89-8bfe-1b9e829376ad" alt="2nd Screenshot" width="250"/>
<img src="https://github.com/user-attachments/assets/5065de4c-75b8-4aa0-87bd-ceaecae5a369" alt="3rd Screenshot" width="250"/>

## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK
- An IDE (e.g., VS Code, Android Studio)

### Installation
1. **Clone the repository:**
    ```bash
    git clone https://github.com/chiragmali19/flutter-weather-app.git
    cd flutter-weather-app
    ```
2. **Install dependencies:**
    ```bash
    flutter pub get
    ```
3. **Run the app:**
    ```bash
    flutter run
    ```

## Usage
1. **Search for Weather:**
    - Enter the location in the search bar.
    - Press the search icon to fetch weather details.
2. **View Weather Details:**
    - Current weather details will be displayed after searching for a location.
3. **View Daily Weather Forecast:**
    - Press the "Show Full Day Weather" button to fetch and display the daily weather forecast in a horizontal layout.

## Project Structure
- `main.dart`: Entry point of the app.
- `home_screen.dart`: Contains the UI and logic for the home screen.
- `api_service.dart`: Contains methods to fetch weather data from the API.

## API
The app uses a mock API service to fetch weather data. Replace the mock API calls with actual API calls in the `ApiService` class.

## Dependencies
- [google_fonts](https://pub.dev/packages/google_fonts): For custom fonts.
- [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter): For weather icons.
- [http](https://pub.dev/packages/http): For making API calls.

## Contributing
Contributions are welcome! Please fork this repository and submit a pull request for any improvements.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact
For any questions or feedback, please contact Chirag Mali at [malichirag1369@gmail.com](mailto:malichirag1369@gmail.com).
