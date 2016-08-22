//
//  DIScope.Arg.swift
//  DITranquillity
//
//  Created by Alexander Ivlev on 11/07/16.
//  Copyright © 2016 Alexander Ivlev. All rights reserved.
//

public extension DIScope {
  public func resolve<T, Arg>(arg arg: Arg) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg) }
  }
  
  public func resolveMany<T, Arg>(arg arg: Arg) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg) }
  }
  
  public func resolve<T, Arg>(Name name: String, arg: Arg) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg) }
  }
  
  public func resolve<T, Arg, Arg1>(arg arg: Arg, _ arg1: Arg1) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1) }
  }
  
  public func resolveMany<T, Arg, Arg1>(arg arg: Arg, _ arg1: Arg1) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1) }
  }
  
  public func resolve<T, Arg, Arg1>(Name name: String, arg: Arg, _ arg1: Arg1) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg, arg1: arg1) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2) }
  }
  
  public func resolveMany<T, Arg, Arg1, Arg2>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2>(Name name: String, arg: Arg, _ arg1: Arg1, _ arg2: Arg2) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3) }
  }
  
  public func resolveMany<T, Arg, Arg1, Arg2, Arg3>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3>(Name name: String, arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4) }
  }
  
  public func resolveMany<T, Arg, Arg1, Arg2, Arg3, Arg4>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4>(Name name: String, arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5) }
  }
  
  public func resolveMany<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5>(Name name: String, arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6) }
  }
  
  public func resolveMany<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(Name name: String, arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6, arg7: Arg7) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7) }
  }
  
  public func resolveMany<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6, arg7: Arg7) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(Name name: String, arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6, arg7: Arg7) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6, arg7: Arg7, arg8: Arg8) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8) }
  }
  
  public func resolveMany<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6, arg7: Arg7, arg8: Arg8) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8>(Name name: String, arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6, arg7: Arg7, arg8: Arg8) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8, _ arg9: Arg9) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6, arg7: Arg7, arg8: Arg8, arg9: Arg9) -> Any
    return try impl.resolve(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8, arg9: arg9) }
  }
  
  public func resolveMany<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9>(arg arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8, _ arg9: Arg9) throws -> [T] {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6, arg7: Arg7, arg8: Arg8, arg9: Arg9) -> Any
    return try impl.resolveMany(self) { (initializer: Method) in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8, arg9: arg9) }
  }
  
  public func resolve<T, Arg, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9>(Name name: String, arg: Arg, _ arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8, _ arg9: Arg9) throws -> T {
    typealias Method = (scope: DIScope, arg: Arg, arg1: Arg1, arg2: Arg2, arg3: Arg3, arg4: Arg4, arg5: Arg5, arg6: Arg6, arg7: Arg7, arg8: Arg8, arg9: Arg9) -> Any
    return try impl.resolve(self, name: name) { (initializer: Method) -> Any in return initializer(scope: self, arg: arg, arg1: arg1, arg2: arg2, arg3: arg3, arg4: arg4, arg5: arg5, arg6: arg6, arg7: arg7, arg8: arg8, arg9: arg9) }
  }
  
}
