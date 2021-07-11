// MARK: - Mocks generated from file: PeekApp/Content/Data/Repository/ContentRepository.swift at 2021-07-11 23:42:41 +0000

//
//  ContentRepository.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Cuckoo
@testable import PeekApp

import Foundation


 class MockContentRepository: ContentRepository, Cuckoo.ProtocolMock {
    
     typealias MocksType = ContentRepository
    
     typealias Stubbing = __StubbingProxy_ContentRepository
     typealias Verification = __VerificationProxy_ContentRepository

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ContentRepository?

     func enableDefaultImplementation(_ stub: ContentRepository) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func searchRepositories(query: String, total: Int, nextToken: String?, _ onCompletion: @escaping (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void)  {
        
    return cuckoo_manager.call("searchRepositories(query: String, total: Int, nextToken: String?, _: @escaping (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void)",
            parameters: (query, total, nextToken, onCompletion),
            escapingParameters: (query, total, nextToken, onCompletion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.searchRepositories(query: query, total: total, nextToken: nextToken, onCompletion))
        
    }
    

	 struct __StubbingProxy_ContentRepository: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func searchRepositories<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.Matchable>(query: M1, total: M2, nextToken: M3, _ onCompletion: M4) -> Cuckoo.ProtocolStubNoReturnFunction<(String, Int, String?, (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void)> where M1.MatchedType == String, M2.MatchedType == Int, M3.OptionalMatchedType == String, M4.MatchedType == (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int, String?, (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void)>] = [wrap(matchable: query) { $0.0 }, wrap(matchable: total) { $0.1 }, wrap(matchable: nextToken) { $0.2 }, wrap(matchable: onCompletion) { $0.3 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockContentRepository.self, method: "searchRepositories(query: String, total: Int, nextToken: String?, _: @escaping (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ContentRepository: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func searchRepositories<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable, M3: Cuckoo.OptionalMatchable, M4: Cuckoo.Matchable>(query: M1, total: M2, nextToken: M3, _ onCompletion: M4) -> Cuckoo.__DoNotUse<(String, Int, String?, (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == Int, M3.OptionalMatchedType == String, M4.MatchedType == (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, Int, String?, (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void)>] = [wrap(matchable: query) { $0.0 }, wrap(matchable: total) { $0.1 }, wrap(matchable: nextToken) { $0.2 }, wrap(matchable: onCompletion) { $0.3 }]
	        return cuckoo_manager.verify("searchRepositories(query: String, total: Int, nextToken: String?, _: @escaping (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ContentRepositoryStub: ContentRepository {
    

    

    
     func searchRepositories(query: String, total: Int, nextToken: String?, _ onCompletion: @escaping (ApiResult<SearchRepositoriesQuery.Data.Search>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: PeekApp/Content/Presentation/Mapper/ContentPresentationMapper.swift at 2021-07-11 23:42:41 +0000

//
//  ContentPresentationMapper.swift
//  PeekApp
//
//  Created by Josué Cadillo on 11-07-21.
//

import Cuckoo
@testable import PeekApp

import Foundation


 class MockContentPresentationMapper: ContentPresentationMapper, Cuckoo.ProtocolMock {
    
     typealias MocksType = ContentPresentationMapper
    
     typealias Stubbing = __StubbingProxy_ContentPresentationMapper
     typealias Verification = __VerificationProxy_ContentPresentationMapper

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ContentPresentationMapper?

     func enableDefaultImplementation(_ stub: ContentPresentationMapper) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func map(_ value: SearchRepositoriesQuery.Data.Search, pullToRefresh: Bool) -> UiRepositoryArgs {
        
    return cuckoo_manager.call("map(_: SearchRepositoriesQuery.Data.Search, pullToRefresh: Bool) -> UiRepositoryArgs",
            parameters: (value, pullToRefresh),
            escapingParameters: (value, pullToRefresh),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.map(value, pullToRefresh: pullToRefresh))
        
    }
    

	 struct __StubbingProxy_ContentPresentationMapper: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func map<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ value: M1, pullToRefresh: M2) -> Cuckoo.ProtocolStubFunction<(SearchRepositoriesQuery.Data.Search, Bool), UiRepositoryArgs> where M1.MatchedType == SearchRepositoriesQuery.Data.Search, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(SearchRepositoriesQuery.Data.Search, Bool)>] = [wrap(matchable: value) { $0.0 }, wrap(matchable: pullToRefresh) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockContentPresentationMapper.self, method: "map(_: SearchRepositoriesQuery.Data.Search, pullToRefresh: Bool) -> UiRepositoryArgs", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ContentPresentationMapper: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func map<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(_ value: M1, pullToRefresh: M2) -> Cuckoo.__DoNotUse<(SearchRepositoriesQuery.Data.Search, Bool), UiRepositoryArgs> where M1.MatchedType == SearchRepositoriesQuery.Data.Search, M2.MatchedType == Bool {
	        let matchers: [Cuckoo.ParameterMatcher<(SearchRepositoriesQuery.Data.Search, Bool)>] = [wrap(matchable: value) { $0.0 }, wrap(matchable: pullToRefresh) { $0.1 }]
	        return cuckoo_manager.verify("map(_: SearchRepositoriesQuery.Data.Search, pullToRefresh: Bool) -> UiRepositoryArgs", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ContentPresentationMapperStub: ContentPresentationMapper {
    

    

    
     func map(_ value: SearchRepositoriesQuery.Data.Search, pullToRefresh: Bool) -> UiRepositoryArgs  {
        return DefaultValueRegistry.defaultValue(for: (UiRepositoryArgs).self)
    }
    
}

