//
//  SpeechToTextView.swift
//  SpeechToText
//
//  Created by legin098 on 10/10/24.
//

import SwiftUI

private enum Layout {
    enum Container {
        static let background: Color = .black
        static let fontColor: Color = .white
        static let spacing: CGFloat = 20.0
    }
    enum ScrollContainer {
        static let height: CGFloat = 200.0
        static let borderWidth: CGFloat = 1.0
        static let borderColor: Color = .white
    }
    enum RecordButton {
        static let startRecordingColor: Color = .green.opacity(0.3)
        static let stopRecordingColor: Color = .red.opacity(0.3)
        static let cornerRadius: CGFloat = 10.0
    }
}

struct SpeechToTextView: View {
    @StateObject private var viewModel = SpeechToTextViewModel(speechToTextService: SpeechToTextService())
    
    var body: some View {
        VStack(spacing: Layout.Container.spacing) {
            Text("Speech To Text")
                .font(.title2)
            
            ScrollView {
                Text(viewModel.transcript)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(height: Layout.ScrollContainer.height)
            .border(Layout.ScrollContainer.borderColor, width: Layout.ScrollContainer.borderWidth)
            .padding()
            
            Button(action: toggleRecord) {
                HStack {
                    Image(systemName: viewModel.isRecording ? "stop.fill" : "mic.fill")
                    Text(viewModel.isRecording ? "Stop" : "Start")
                }
            }
            .padding()
            .background(
                viewModel.isRecording ? Layout.RecordButton.stopRecordingColor : Layout.RecordButton.startRecordingColor
            )
            .cornerRadius(Layout.RecordButton.cornerRadius)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Layout.Container.background)
        .foregroundStyle(Layout.Container.fontColor)
    }
    
    private func toggleRecord() {
        if viewModel.isRecording {
            viewModel.stopRecording()
        } else {
            viewModel.startRecording()
        }
    }
}

#Preview {
    SpeechToTextView()
}
