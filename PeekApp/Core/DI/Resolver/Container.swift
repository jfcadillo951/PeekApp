//
//  DependencyContainer.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

public enum DIOption {
    case container
    case newInstance
}

public final class Container {

    public init() {}

    private let lock = SpinLock()
    private var services: [DIKey: Any] = [:]
    private var serviceOptions: [DIKey: DIOption] = [:]
    private var containerServices: [DIKey: Any] = [:]

    public func register<T>(
        _ type: T.Type,
        _ name: String? = nil,
        _ option: DIOption = .newInstance,
        _ factory: @escaping (DIResolver) -> T ) {
        _register(type, name, option, factory)
    }

    public func register<T, A>(
        _ type: T.Type,
        _ name: String? = nil,
        _ option: DIOption = .newInstance,
        _ factory: @escaping (DIResolver, A) -> T ) {
        _register(type, name, option, factory)
    }
}

extension Container: DIResolver {
    public func resolve<T>(_ type: T.Type) -> T {
        resolve(type, nil)
    }

    public func resolve<T>(_ type: T.Type, _ name: String?) -> T {
        let args: (DIResolver) = (self)
        return _resolve(type, name, args)
    }

    public func resolve<T, A>(_ type: T.Type, argument: A) -> T {
        resolve(type, nil, argument: argument)
    }

    public func resolve<T, A>(_ type: T.Type, _ name: String?, argument: A) -> T {
        let args: (DIResolver, A) = (self, argument)
        return _resolve(type, name, args)
    }
}

private extension Container {
    func _register<T, Arguments>(
        _ type: T.Type,
        _ name: String? = nil,
        _ option: DIOption = .newInstance,
        _ factory: @escaping (Arguments) -> T
        ) {
        lock.sync {
            let key = DIKey(
                type: type,
                name: name,
                argumentsType: Arguments.self)
            services[key] = factory
            serviceOptions[key] = option
            if containerServices[key] != nil {
                // if there is already a singleton delete the previous one
                containerServices.removeValue(forKey: key)
            }
        }
    }

    func _resolveClosure<T, Arguments>(
        _ type: T.Type,
        _ name: String?,
        _ argumentsType: Arguments) -> ((Arguments) -> T) {
        lock.sync {
            let key = DIKey(
                type: type,
                name: name,
                argumentsType: Arguments.self)
            guard let value = services[key] as? (Arguments) -> T else {
                fatalError("could not resolve it")
            }
            return value
        }
    }

    func _resolve<T, Arguments>(_ type: T.Type, _ name: String?, _ arguments: Arguments) -> T {
        lock.sync {
            let key = DIKey(
                type: type,
                name: name,
                argumentsType: Arguments.self)
            guard let option = serviceOptions[key] else {
                fatalError("could not resolve it")
            }
            if option == .container {
                if let value = containerServices[key] as? T {
                    return value
                }
            }
            let service = _resolveClosure(type, name, arguments)
            let value = service(arguments)
            if option == .container {
                containerServices[key] = value
            }
            return value
        }
    }
}
