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

@implementation benchmark
-(float) bench {
    int n = 100;
    int* a = new int[n * n]();
    int* b = new int[n * n]();
    int m = 2;
    int* dest = new int[m * m]();
    for (int i = 0; i < n; i++) {
        a[i] = rand() % 10;
        b[i] = rand() % 10;
    }
    auto start = std::chrono::high_resolution_clock::now();

    for (int k = -m; k < m; k++) {
        for (int l = -m; l < m; l++) {
            int destidx = k * m + l;
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

    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> elapsed = end - start;
    float result = elapsed.count();
    std::cout << "Elapsed time: " << elapsed.count() << " ms" << endl;

    return result;
};
@end
