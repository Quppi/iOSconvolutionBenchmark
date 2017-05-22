//
//  cppBench.hpp
//  MemoryPerformanceTest
//
//  Created by Philipp Meyer on 17.05.17.
//  Copyright © 2017 Philipp Meyer. All rights reserved.
//

#ifndef cppBench_hpp
#define cppBench_hpp

#include <stdio.h>
#import <Foundation/Foundation.h>

@interface benchmark : NSObject
- (void) backgroundBench;

- (void) testBench;

-(float) bench: (int) cycleCount;
@end


#endif /* cppBench_hpp */
