//
//  SpeechToTextViewModel.swift
//  SpeechToText
//
//  Created by legin098 on 10/10/24.
//

import Foundation
import SwiftUI

final class SpeechToTextViewModel: ObservableObject {
    @Published var transcript: String = ""
    @Published var isRecording = false
    @Published var errorMessage: String?
    
    private let speechToTextService: SpeechToTextService
    
    private var transcriptionTask: Task<Void, Never>?
    
    init(speechToTextService: SpeechToTextService) {
        self.speechToTextService = speechToTextService
    }
    
    /// Starts the recording and transcription process.
    /// - Calls the service to authorize the use of voice recognition and begins transcription.
    /// - Updates the `transcript` variable with partial results as they are recognized.
    @MainActor
    func startRecording() {
        guard !isRecording else {
            return
        }
        
        isRecording = true
        
        transcriptionTask = _Concurrency.Task {
            do {
                try await speechToTextService.authorize()
                
                let stream = speechToTextService.transcribe()
                for try await partialResult in stream {
                    self.transcript = partialResult
                }
            } catch {
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    /// Stops the recording and transcription process.
    /// - Ends the background task and resets the recording state.
    @MainActor
    func stopRecording() {
        guard isRecording else {
            return
        }
        isRecording = false
        transcriptionTask?.cancel()
        transcriptionTask = nil
        speechToTextService.stopTranscribing()
    }
}
