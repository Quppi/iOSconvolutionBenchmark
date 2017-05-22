//
//  cppBench.cpp
//  MemoryPerformanceTest
//
//  Created by Philipp Meyer on 17.05.17.
//  Copyright © 2017 Philipp Meyer. All rights reserved.
//

#include "cppBench.hpp"
#include <chrono>
#include <iostream>

using namespace std;

@interface benchmark() {
}
@end

#define kPadSize 5000

@implementation benchmark

- (void) backgroundBench
{
    [self performSelectorInBackground: @selector(testBench) withObject: NULL];
}

- (void) testBench
{
    static int cycleCount = 10;
    int testCount= 100;
    
    std::cout << "cycleCount: " << cycleCount << " testCount: " << testCount << endl;
    [self bench: cycleCount];
    float total= 0;
    for(int i = 0; i < testCount; i ++)
    {
        total+= [self bench: cycleCount];
    }

    total = total/testCount;
    std::cout << "Done Avg: " << total <<endl;
//    cycleCount++;

}


-(float) bench: (int) cycleCount
{
    int n = 200;
    int* a = new int[n * n + kPadSize]();
    int* b = new int[n * n + kPadSize]();
    int m = 2;
    int* dest = new int[4 * m * m + kPadSize]();
    for (int i = 0; i < n; i++) {
        a[i] = rand() % 10;
        b[i] = rand() % 10;
    }
    auto start = std::chrono::high_resolution_clock::now();
    
    for (int curCount = 0; curCount < cycleCount; curCount++)
    {
        for (int k = -m; k < m; k++) {
            for (int l = -m; l < m; l++) {
                int destidx = (k + m) * m + (l + m);
                dest[destidx] = 0;
                for (int i = m; i < n - m; i++) {
                    int r = 0;
                    for (int j = m; j < n - m; j++) {
                        r += a[i * n + j] - b[(i + k) * n + (j + l)];
                    }
                    dest[destidx] += r / (n - 2 * m);
                }
            }
        }
    }

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> elapsed = end - start;
    float result = elapsed.count();
    
    std::cout << "  Time:" << elapsed.count() << " ms" <<endl;
    
    delete[] a;
    delete[] b;
    delete[] dest;
    
    return result;
};
@end
