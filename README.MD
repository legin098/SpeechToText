# Speech-to-Text in iOS with SwiftUI and Swift Concurrency

This project implements real-time speech-to-text functionality using **SwiftUI**, **Swift Concurrency**, and iOS's **Speech** framework.

## Features

- **Real-Time Transcription**: Converts audio to text using `SFSpeechRecognizer`.
- **Swift Concurrency**: Manages transcription with `AsyncThrowingStream`.
- **Permission Management**: Requests microphone and speech recognition permissions.
- **Modular Design**: Decoupled logic from the UI for better maintenance and scalability.

## Requirements

- iOS 16.0+
- Xcode 15.4+
- Swift 5.5+

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/legin098/SpeechToText.git
   ```
2. Open the project in Xcode:
   ```bash
   cd SpeechToText
   open SpeechToText.xcodeproj
   ```
3. Run the project on a simulator or physical device.

## Usage

1. Ensure you grant microphone and speech recognition permissions when starting the app.
2. Press the "Start" button to begin recording and transcribing.
3. Press "Stop" to end the transcription.

## Project Structure

`SpeechToTextService`: Manages the speech-to-text logic.
`SpeechToTextViewModel`: Acts as an intermediary between the view and the service.
`SpeechToTextView`: User interface built with SwiftUI.

## Contributions

Contributions are welcome. Fork the repository, create a new branch, and open a pull request with your improvements.

## Contact

- [LinkedIn: Jesus Cruz Suárez](https://www.linkedin.com/in/jesusantoniocruzsuarez-desarrollador/)
- [GitHub: legin098](https://github.com/legin098)
