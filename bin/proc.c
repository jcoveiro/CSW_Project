#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *file;
    char line[256];

    // Open the pipe file for reading
    file = fopen("/tmp/temp_info_pipe", "r");
    if (file == NULL) {
        perror("Error opening file");
        return EXIT_FAILURE;
    }

    // Read each line from the file
    while (fgets(line, sizeof(line), file)) {
        // Print each line to the standard output
        printf("%s", line);
    }

    // Close the file
    fclose(file);

    return 0;
}
