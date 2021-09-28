//
//  Gateway.swift
//  NearBy
//
//  Created by Amr Saleh on 9/28/21.
//

import Moya
import Gloss

class Gateway<ServiceType: TargetType> {
    
    private var provider: MoyaProvider<ServiceType>!
    
    // MARK: - Initializer
    init() {
        let endpointClosure = { (target: ServiceType) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target).adding(newHTTPHeaderFields: ["Content-Type": "application/json"])
            return defaultEndpoint
        }
        provider = MoyaProvider<ServiceType>(endpointClosure: endpointClosure)
    }
    
    func request<DataType: Glossy>(target: ServiceType, responseType: DataType.Type, completion: @escaping (_ networkReply: NetworkReply, _ statusCode: Int, _ message: String, _ response: DataType?) -> Void) {
        print("🔷 Endpoint: \(target.baseURL.absoluteString + target.path)")
        print("🔷 Headers: \(target.headers ?? [:])")
        print("🔷 Method: \(target.method.rawValue)")
        
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                print("🔷 StatusCode: \(response.statusCode)")
                print("🔷 DataString: \(String(data: response.data, encoding: .utf8) ?? "")")
                if let apiResponse = DataType(data: response.data) {
                    completion(.success, response.statusCode, "", apiResponse)
                } else {
                    completion(.failure, response.statusCode, "\("something Went Wrong") \n(Error \(response.statusCode))", nil)
                }
            case .failure(let error):
                print("❌ Error: \(error.localizedDescription)")
                completion(.failure, error.response?.statusCode ?? 0, error.localizedDescription, nil)
            }
        }
    }
}
