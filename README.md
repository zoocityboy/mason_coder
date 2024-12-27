![alt text](https://raw.githubusercontent.com/zoocityboy/mason_coder/main/assets/mason_coder.webp "Resoure")
Developed by 🦏 [zoocityboy][zoocityboy_link]
# Melos Workspace Cleaner

[![Pub](https://img.shields.io/pub/v/mason_coder.svg?style=flat-square)](https://pub.dev/packages/mason_coder)
[![pub points](https://img.shields.io/pub/points/mason_coder?style=flat-square&color=2E8B57&label=pub%20points)](https://pub.dev/packages/mason_coder/score)
[![ci](https://github.com/zoocityboy/melos_workspace_cleaner/actions/workflows/ci.yaml/badge.svg?style=flat-square)](https://github.com/zoocityboy/melos_workspace_cleaner/actions/workflows/ci.yaml)
[![coverage](https://raw.githubusercontent.com/zoocityboy/melos_workspace_cleaner/main/coverage_badge.svg?style=flat-square)](https://github.com/zoocityboy/melos_workspace_cleaner/actions)
[![License: MIT](https://img.shields.io/badge/license-MIT-purple.svg?style=flat-square)](https://opensource.org/licenses/MIT)
[![style: zoo lints](https://img.shields.io/badge/style-zoo_lints-3EB489.svg?style=flat-square)](https://pub.dev/packages/zoo_lints)

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=flat-square&logo=dart&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=flat-square&logo=githubactions&logoColor=white)

# Mason Coder

Mason Coder is a tool for creating and managing Mason Brick templates efficiently. It helps in converting your runnable code into Mason Bricks.

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

## Creating Settings for mason_template.yaml

The `mason_template.yaml` file is used to define the structure and variables for your Mason templates. Here is an example configuration:

```yaml
template: eit_feature
description: Feature template for Embedit Platform.
source: 
 - lib/features/tpl_feature_name
 - test/
vars:
  name:
    type: string
    description: Name of feature
    prompt: Feature name
  state_management:
    type: enum
    default: bloc
    description: The features state management
    prompt: What is the features state management?
    values:
      - bloc
      - cubit
      - none
  list:
    type: boolean
    description: Generate list component
    prompt: Generate List Component?
    default: true
  detail:
    type: boolean
    description: Generate Detail component
    prompt: Generate Detail Component?
    default: true
replaces:
  content: 
    - key: "/*_start_isbloc*/"
      value: "{{#isBloc}}"
    - key:  "/*_end_isbloc*/"
      value: "{{/isBloc}}"
    - key: "isbloc_"
      value: ""

    - key: "/*_start_iscubit*/"
      value: "{{#isCubit}}"
    - key: "/*_end_iscubit*/"
      value: "{{/isCubit}}"
    - key: "iscubit_"
      value: ""

    - key: "/*_start_isdetail*/"
      value: "{{#isDetail}}"
    - key: "/*_end_isdetail*/"
      value: "{{/isDetail}}"
    - key: "isdetail_"
      value: ""    
    
    - key: "/*_start_islist*/"
      value: "{{#isList}}"
    - key: "/*_end_islist*/"
      value: "{{/isList}}"
    - key: "islist_"
      value: ""
    
    - key: eit_feature
      value: "{{packageName.snakeCase()}}"

    - key: tpl_feature_name_detail
      value: "{{feature_name.snakeCase()}}_detail"
    - key: TplFeatureNameDetail
      value: "{{feature_name.pascalCase()}}Detail"
    - key: tpl_feature_name_list
      value: "{{feature_name.snakeCase()}}_list"
    - key: TplFeatureNameList
      value: "{{feature_name.pascalCase()}}List"
    - key: tpl_feature_name
      value: "{{feature_name.snakeCase()}}"
    - key: TplFeatureName
      value: "{{feature_name.pascalCase()}}"
    - key: tplFeatureNameRouter
      value: "{{feature_name.camelCase()}}Router"
    - key: tplFeatureNameListRoute
      value: "{{feature_name.snakeCase()}}ListRoute"
    - key: tplFeatureNameDetailRoute
      value: "{{feature_name.snakeCase()}}DetailRoute"
    - key: "a@b.cz"
      value: "{{{feature_owner}}}"
  path:
    - key: tpl_feature_name
      value: "{{feature_name.snakeCase()}}"
    - key: isdetail_
      prefix: "{{#isDetail}}"
      suffix: "{{/isDetail}}"
    - key: islist_
      prefix: "{{#isList}}"
      suffix: "{{/isList}}"
    - key: isbloc_
      prefix: "{{#isBloc}}"
      suffix: "{{/isBloc}}"
    - key: iscubit_
      prefix: "{{#isCubit}}"
      suffix: "{{/isCubit}}"
    - key: ispage_
      prefix: "{{#isPage}}"
      suffix: "{{/isPage}}"

clean:
  - lib/config
  - test/helpers
ext: 
  - dart
  - yaml
  - yml
  - md
  - mdx
```

## Contributing

We welcome contributions! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch for your feature or bugfix.
3. Make your changes and commit them with clear messages.
4. Submit a pull request to the main repository.

For more details, refer to our Contributing Guidelines.

## Acknowledgements

We would like to thank the following projects and contributors:

- [Mason](https://pub.dev/packages/mason_cli) for providing the template generation framework.
- All contributors who have helped improve this project.

For more details on how to use this project and create templates, refer to the documentation in the [docs](http://_vscodecontentref_/8) directory.

For any issues or contributions, please refer to the [GitHub repository](https://github.com/zoocityboy/mason_bundler).


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

-------------------
[![zoocityboy][logo_white]][zoocityboy_link_dark]
[![zoocityboy][logo_black]][zoocityboy_link_light]


[logo_black]:https://raw.githubusercontent.com/zoocityboy/zoo_brand/main/styles/README/zoocityboy_dark.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/zoocityboy/zoo_brand/main/styles/README/zoocityboy_light.png#gh-dark-mode-only
[zoocityboy_link]: https://github.com/zoocityboy
[zoocityboy_link_dark]: https://github.com/zoocityboy#gh-dark-mode-only
[zoocityboy_link_light]: https://github.com/zoocityboy#gh-light-mode-only