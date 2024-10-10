#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    const char *fifo_path = "/tmp/response_pipe";
    char buffer[256];
    int fd = open(fifo_path, O_RDONLY);

    if (fd == -1) {
        perror("open");
        exit(EXIT_FAILURE);
    }

    while (1) {
        ssize_t bytes_read = read(fd, buffer, sizeof(buffer) - 1);
        if (bytes_read == -1) {
            perror("read");
            close(fd);
            exit(EXIT_FAILURE);
        } else if (bytes_read == 0) {
            // End of file
            break;
        }

        buffer[bytes_read] = '\0'; // Null-terminate the buffer
        //printf("Read: %s\n", buffer);
	printf("%s\n", buffer);
    }

    close(fd);
    return 0;
}
