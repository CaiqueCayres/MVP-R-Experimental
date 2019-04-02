//
//  Result.swift
//  MVPR Example
//
//  Created by Carlos Henrique Cayres on 15/01/19.
//  Copyright © 2019 MBLabs. All rights reserved.
//

import Foundation

public enum Result<A> {
    case success(A)
    case failure(Error?)

    public var isSuccess: Bool {
        if case .success = self {
            return true
        }

        return false
    }

    public var isFailure: Bool {
        if case .failure = self {
            return true
        }

        return false
    }

    public var value: A? {
        if case .success(let value) = self {
            return value
        }

        return nil
    }

    public var error: Error? {
        if case .failure(let error) = self {
            return error
        }

        return nil
    }

    public func map<B>(_ block: (A) -> B) -> Result<B> {
        switch self {
        case .success(let value):
            return Result<B>.success(block(value))

        case .failure(let error):
            return Result<B>.failure(error)
        }
    }
}
