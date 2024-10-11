//
//  RecognizerError.swift
//  SpeechToText
//
//  Created by legin098 on 10/10/24.
//

import Foundation

enum RecognizerError: Error {
    case nilRecognizer
    case notAuthorizedToRecognize
    case notPermittedToRecord
    case recognizerUnavailable
    case invalidAudioSession
    
    var message: String {
        switch self {
        case .nilRecognizer:
            return "Can't initialize speech recognizer"
        case .notAuthorizedToRecognize:
            return "Not authorized to recognize speech"
        case .notPermittedToRecord:
            return "Not permitted to record audio"
        case .recognizerUnavailable:
            return "Recognizer is unavailable"
        case .invalidAudioSession:
            return "The audio session is invalid"
        }
    }
}
