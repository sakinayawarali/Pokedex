# PokeDex App

The PokeDex App is a Flutter application that allows users to browse through a collection of Pokémon and view their details. The app fetches data from a remote API and displays it in a user-friendly interface.

## Features

- Browse through a list of Pokémon
- View detailed information about each Pokémon, including:
  - Name
  - Image
  - Type
  - Height
  - Weight
  - Base stats
  - Abilities
  - Evolutions

## Technologies Used

- Flutter
- Dart
- Provider (for state management)
- HTTP package (for making API requests)

## Getting Started

1. Clone the repository:


git clone https://github.com/sakinayawarali/Pokedex


2. Navigate to the project directory:


cd pokedex-app


3. Install dependencies:


flutter pub get


4. Run the app:


flutter run


## Code Organization

The project follows a modular structure with separate directories for models, providers, services, and views.

- models/: Contains classes representing Pokémon data.
- providers/: Implements the Provider pattern for state management.
- services/: Handles API requests and data fetching.
- screens/: UI for the two screens.
- themes/: Functions for the Colors and TextStyles used.

## API

The app fetches data from the following API endpoint:


https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json
