// 

import Foundation

enum WalletConnectError: Error {
    
    // 1000 (Internal)
    case `internal`(_ reason: InternalReason)

    // 2000 (Timeout)
    // 3000 (Unauthorized)
    case unauthrorized(_ reason: UnauthorizedReason)
    
    // 4000 (EIP-1193)
    // 5000 (CAIP-25)
    // 9000 (Unknown)
    
    enum InternalReason: Error {
        case notApproved
        case malformedPairingURI
        case unauthorizedMatchingController
        case noSequenceForTopic
        case pairingProposalGenerationFailed
        case subscriptionIdNotFound
        case keyNotFound
        case deserialisationFailed
        case jsonRpcDuplicateDetected
        case noJsonRpcRequestMatchingResponse
        case pairWithExistingPairingForbidden
    }
    
    public enum UnauthorizedReason: Error {
        case unauthorizedTargetChain
        case unauthorizedJsonRpcMethod
        case unauthorizedNotificationType
        case unauthorizedUpdateRequest
        case unauthorizedUpgradeRequest
    }
}

extension WalletConnectError: CustomStringConvertible {
    
    var description: String {
        return "code: \(code) - message: \(localizedDescription)"
    }
    
    var code: Int {
        switch self {
        case .internal(let reason):
            return reason.code
        case .unauthrorized(let reason):
            return reason.code
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .internal(let reason):
            return reason.description
        case .unauthrorized(let reason):
            return reason.description
        }
    }
}

extension WalletConnectError.InternalReason: CustomStringConvertible {
    
    //FIX add codes matching js repo
    var code: Int {
        switch self {
        case .notApproved: return 1601
        case .malformedPairingURI: return 1001
        case .unauthorizedMatchingController: return 1002
        case .noSequenceForTopic: return 1003
        case .pairingProposalGenerationFailed: return 1004
        case .subscriptionIdNotFound: return 1005
        case .keyNotFound: return 1006
        case .deserialisationFailed: return 1007
        case .jsonRpcDuplicateDetected: return 1008
        case .pairWithExistingPairingForbidden: return 1009
        case .noJsonRpcRequestMatchingResponse: return 1010
        }
    }
    
    //FIX descriptions
    var description: String {
        switch self {
        case .notApproved:
            return "Session not approved"
        case .malformedPairingURI:
            return "Pairing URI string is invalid."
        case .unauthorizedMatchingController:
            return "unauthorizedMatchingController"
        case .noSequenceForTopic:
            return "noSequenceForTopic"
        case .pairingProposalGenerationFailed:
            return "pairingProposalGenerationFailed"
        case .subscriptionIdNotFound:
            return "Subscription Id Not Found"
        case .keyNotFound:
            return "Key Not Found"
        case .deserialisationFailed:
            return "Deserialisation Failed"
        case .jsonRpcDuplicateDetected:
            return "Json Rpc Duplicate Detected"
        case .noJsonRpcRequestMatchingResponse:
            return "No matching JSON RPC request for given response"
        case .pairWithExistingPairingForbidden:
            return "Pairing for uri already exist - Action Forbidden"
        }
    }
}

extension WalletConnectError.UnauthorizedReason: CustomStringConvertible {
    
    var code: Int {
        switch self {
        case .unauthorizedTargetChain: return 3000
        case .unauthorizedJsonRpcMethod: return 3001
        case .unauthorizedNotificationType: return 3002
        case .unauthorizedUpdateRequest: return 3003
        case .unauthorizedUpgradeRequest: return 3004
        }
    }
    
    var description: String {
        switch self {
        case .unauthorizedTargetChain:
            return "Unauthorized Target ChainId Requested"
        case .unauthorizedJsonRpcMethod:
            return "Unauthorized JSON-RPC Method Requested"
        case .unauthorizedNotificationType:
            return "Unauthorized Notification Type Requested"
        case .unauthorizedUpdateRequest:
            return "Unauthorized update request"
        case .unauthorizedUpgradeRequest:
            return "Non-Controller Client is not authorized to upgrade session"
        }
    }
}
