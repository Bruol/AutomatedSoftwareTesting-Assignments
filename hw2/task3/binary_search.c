#include <stdio.h>
#include <assert.h>
#include "klee/klee.h"

// #define DEBUG

#ifdef DEBUG
void print_data(int arr[], int size, int target) {
    printf("Searching for position to insert %d in:\n[", target);
    for (int i=0; i < size-1; i++) {
        printf("%d, ", arr[i]);
    }
    printf("%d]\n", arr[size-1]);
}
#endif

int binary_search(int arr[], int size, int target) {
    #ifdef DEBUG
    print_data(arr, size, target);
    #endif
    int left = 0;
    int right = size;
    while (left < right) {
        int mid = (left + right) / 2;
        if (target < arr[mid]) {
            right = mid;
        } else {
            left = mid + 1;
        }
    }
    return left;
}

/*
int is_sorted(int arr[], int size) {
}
*/

int main() {
    int a[10];
    int x;
    printf("Please input an sorted array of 10 integers: ");
    for (int i = 0; i < 10; i++) {
        scanf("%d", &a[i]);
    }
    printf("Please input an integer: ");
    scanf("%d", &x);

    int pos = binary_search(a, 10, x);
    #ifdef DEBUG
    printf("The position to insert %d is %d\n", x, pos);
    #endif

    // Check postcondition
    for (int i = 0; i < pos; i++) {
        assert(a[i] < x);
    }
    for (int i = pos; i < 10; i++) {
        assert(a[i] >= x);
    }

    printf("The algorithm passed correctness check.\n");
    return 0;
}