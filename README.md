# News Search App

This is a **News Search App** built with Flutter that allows users to search for news articles using the [NewsAPI](https://newsapi.org/v2/). The app follows **Clean Architecture** principles and uses **Riverpod** for state management. It also leverages **environment variables** for secure API key management.

## Features

- **Search News**: Users can search for news articles by entering a query.
- **Search History**: The app maintains a history of previous search queries.
- **Delete Search History**: Users can remove individual search queries from the history.
- **Clean Architecture**: The app is structured using Clean Architecture principles for separation of concerns and scalability.
- **State Management**: Riverpod is used for efficient and reactive state management.
- **Environment Variables**: API keys and other sensitive data are managed using environment variables.

## API Used

The app uses the [NewsAPI](https://newsapi.org/v2/) to fetch news articles. To use the API, you need to:

1. Visit [NewsAPI](https://newsapi.org/) and sign up for an API key.
2. After sign up and API is generated and shown your account dashboard.
3. Add the API key to the `.env.json` file (see [Environment Variables](#environment-variables) below).

## Clean Architecture

The app follows **Clean Architecture**, which separates the code into layers:

1. **Presentation Layer**: Contains the UI and state management (Riverpod).
2. **Domain Layer**: Contains business logic and use cases.
3. **Data Layer**: Handles data sources (e.g., API, local storage).

This separation ensures the app is modular, testable, and maintainable.

## State Management with Riverpod

The app uses **Riverpod** for state management. Riverpod provides a simple and flexible way to manage app state, ensuring that the UI is always in sync with the data.

Key features of Riverpod used in this app:

- **StateNotifierProvider**: Manages the state of the search history.
- **ConsumerWidget/ConsumerStatefulWidget**: Watches state changes and rebuilds the UI accordingly.

## Environment Variables

The app uses **environment variables** to securely manage sensitive data like API keys. This is achieved using the `--dart-define-from-file` flag in Flutter.

### Steps to Set Up Environment Variables

1. Create a `.env.json` file in the root of your project.
2. Add the following structure to the file:

```json
{
  "BASE_URL": "base_url_here",
  "API_KEY": "your_api_key_here"
}
```

3. Replace `your_api_key_here` with your actual NewsAPI key.

4. Run the app with the following command:

```
flutter run --dart-define-from-file=.env.json
```

### Example `.env.json` File

An example `.env.json` file is provided as `.env.example.json`. Rename it to `.env.json` and add the "BASE_URL" and your "API_KEY" generated from [NewsAPI](https://newsapi.org/).

## How to Run the App

1. Clone the repository:

```bash
git clone https://github.com/N-DiLo/news_access.git
```

2. Navigate to the project directory:

```
cd news_access
```

3. Add your API key to the `.env.json` file as described above.
4. Install dependencies:

```
flutter pub get
```

5. Run the app:

```
flutter run --dart-define-from-file=.env.json
```

## Dependencies

The app uses the following dependencies:

- **flutter_riverpod**: For state management.
- **shared_preferences**: For local storage of search history.
- **dio**: For making API requests to NewsAPI.
- **toastification**: For displaying in-app toasts.

## Folder Structure

The app is organized as follows:

```
lib/
├── core/
│   ├── constants/            # App constants (e.g., colors, strings)
│   ├── services/             # Shared services (e.g., API clients)
│   └── shared/               # Shared utilities and helpers
├── features/
│   ├── feature/              # Feature-specific code
│       ├── data/             # Data layer (e.g., repositories, data sources)
│       │   ├── entities/     # Data models/entities
│       ├── domain/           # Domain layer (e.g., use cases, providers)
│       └── presentation/     # Presentation layer (UI)
│           ├── screens/      # App screens
│           └── widgets/      # Reusable widgets
└── main.dart                 # App entry point
```

## Screenshots

![Search Screen](assets/images/empty_search.png)
![Search History](assets/images/search.png)
![Search Response](assets/images/search_response.png)
![Response Detail Modal](assets/images/response_detail.png)

Happy Coding! 🚀
