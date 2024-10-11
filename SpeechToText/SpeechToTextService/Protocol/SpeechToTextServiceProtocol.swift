//
//  SpeechToTextServiceProtocol.swift
//  SpeechToText
//
//  Created by legin098 on 10/10/24.
//

import Foundation

protocol SpeechToTextServiceProtocol {
    func authorize() async throws
    func transcribe() -> AsyncThrowingStream<String, Error>
    func stopTranscribing()
}
