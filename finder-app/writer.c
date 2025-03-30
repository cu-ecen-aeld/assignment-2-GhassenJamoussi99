#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <string.h>

int main(int argc, char *argv[]) {
    // Open syslog with LOG_USER facility
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    // Check for correct number of arguments
    if (argc != 3) {
        syslog(LOG_ERR, "Invalid number of arguments. Usage: ./writer <writefile> <writestr>");
        fprintf(stderr, "Usage: ./writer <writefile> <writestr>\n");
        closelog();
        exit(1);
    }

    const char *writefile = argv[1];
    const char *writestr = argv[2];

    // Open the file for writing
    FILE *file = fopen(writefile, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Failed to open file %s for writing", writefile);
        perror("Error opening file");
        closelog();
        exit(1);
    }

    // Write the string to the file
    if (fprintf(file, "%s", writestr) < 0) {
        syslog(LOG_ERR, "Failed to write to file %s", writefile);
        perror("Error writing to file");
        fclose(file);
        closelog();
        exit(1);
    }

    // Log the successful write operation
    syslog(LOG_DEBUG, "Writing %s to %s", writestr, writefile);

    // Close the file
    fclose(file);

    // Close syslog
    closelog();

    return 0;
}