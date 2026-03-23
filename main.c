#include <stdio.h>
#include <stdlib.h>

int array_sum(int *arr, int n);

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <datafile>\n", argv[0]);
        return 1;
    }

    FILE *fp = fopen(argv[1], "r");
    if (!fp) {
        fprintf(stderr, "Error: cannot open file '%s'\n", argv[1]);
        return 1;
    }

    int n;
    if (fscanf(fp, "%d", &n) != 1 || n <= 0) {
        fprintf(stderr, "Error: invalid count on first line\n");
        fclose(fp);
        return 1;
    }

    int *arr = (int *)malloc(n * sizeof(int));
    if (!arr) {
        fprintf(stderr, "Error: malloc failed\n");
        fclose(fp);
        return 1;
    }

    for (int i = 0; i < n; i++) {
        if (fscanf(fp, "%d", &arr[i]) != 1) {
            fprintf(stderr, "Error: expected %d values, got %d\n", n, i);
            free(arr);
            fclose(fp);
            return 1;
        }
    }
    fclose(fp);

    int sum = array_sum(arr, n);

    printf("Sum = %d\n", sum);

    free(arr);
    return 0;
}
