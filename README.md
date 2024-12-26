# Mason Brick Generator Project

This project is a Mason Brick Generator setup for creating and managing templates efficiently.

## Features

- Generate templates for various use cases.
- Manage and customize templates easily.
- Integrate with Mason for streamlined template handling.

## Project Structure

```
. ├── bin/ 
│ └── mason_coder.dart 
├── docs/ 
│ ├── .astro/ 
│ ├── public/ 
│ ├── src/ 
│ └── README.md 
├── lib/ 
│ ├── bundle/ 
│ │ └── mason_coder.dart 
│ └── src/ 
├── samples/ 
├── shema/ 
│ └── mason-template-schema.json 
├── .gitignore 
├── analysis_options.yaml 
├── build.yaml 
├── CHANGELOG.md 
├── generate.sh 
├── pubspec.yaml 
├── pubspec.lock 
└── README.md
```

## Installation

To get started with this project, you need to have Dart and Mason installed on your machine.

1. **Clone the repository:**

    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Install dependencies:**

    ```sh
    dart pub get
    ```

3. **Install Mason Coder:**

    ```sh
    dart pub global activate mason_coder
    ```

## Running the Project

To run the project, use the following commands:

1. **Generate templates:**

    ```sh
    mason_coder make
    ```

2. **Run the main script:**

    ```sh
    dart run global mason_coder
    ```

## Usage

To use the generated templates, follow these steps:

1. **Generate a new template:**

    ```sh
    mason_coder make <template-name>
    ```

2. **Customize the generated files as needed.**

## Contributing

We welcome contributions! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Make your changes and commit them with clear messages.
4. Submit a pull request to the main repository.

For more details, refer to our Contributing Guidelines.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

## Acknowledgements

We would like to thank the following projects and contributors:

- [Mason](https://pub.dev/packages/mason_cli) for providing the template generation framework.
- All contributors who have helped improve this project.

For more details on how to use this project and create templates, refer to the documentation in the [docs](http://_vscodecontentref_/8) directory.

For any issues or contributions, please refer to the [GitHub repository](https://github.com/zoocityboy/mason_bundler).

