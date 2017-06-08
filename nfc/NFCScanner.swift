//
//  NFCScanner.swift
//  nfc
//
//  Created by Antoine Barrault on 08/06/2017.
//  Copyright © 2017 Antoine Barrault. All rights reserved.
//

import CoreNFC

protocol NFCScannerProtocol: class {
    var scannerSession: NFCReaderSession? { get set }
    func startSession()
}

class NFCScanner: NSObject, NFCScannerProtocol {
    var scannerSession: NFCReaderSession?

    func startSession() {
        if let session = scannerSession {
            session.invalidate()
            scannerSession = nil
        }
        scannerSession = NFCNDEFReaderSession(delegate: self,
                                              queue:nil,
                                              invalidateAfterFirstRead:true)
        scannerSession?.begin()
    }

}

extension NFCScanner: NFCNDEFReaderSessionDelegate {

    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("reader session invalidate with error: \(error.localizedDescription)")
        if session == scannerSession {
            scannerSession = nil
        }
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("reader session did detect NDEFs messages: \(messages)")
    }

}

