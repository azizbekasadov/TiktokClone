//
//  LocalJSONDataDecoder.swift
//  TiktokClone
//
//  Created by Azizbek Asadov on 15.10.2025.
//

import Foundation

final class LocalJSONDataDecoder {
    enum LocalJSONDataDecoderError: Error {
        case noDataFound
        case invalidFileName
    }
    
    static let shared = LocalJSONDataDecoder()
    
    private init() {}
    
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func decode<T: Codable>(
        _ type: T.Type,
        from fileName: String,
        withExtesion fileExtension: String = "json",
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            completion(.failure(LocalJSONDataDecoderError.invalidFileName))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            
            let result: T = try decodeData(data: data)
            completion(.success(result))
        } catch {
            debugPrint(error.localizedDescription)
            completion(.failure(error))

        }
    }
    
    func decode<T: Codable>(
        data: Data,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        do {
            let result: T = try decodeData(data: data)
            completion(.success(result))
        } catch {
            debugPrint(error.localizedDescription)
            completion(.failure(error))
        }
    }
    
    private func decodeData<T: Codable>(
        data: Data,
    ) throws -> T {
        try decoder.decode(T.self, from: data)
    }
}
