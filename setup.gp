# Create the pipes
system("mkfifo temp_info_pipe");
system("mkfifo response_pipe");
print("Pipes created successfully.");

# Read temperature data
temp_info_pipe = "temp_info_pipe";
temp_fd = open(temp_info_pipe, "r");
if (temp_fd == -1, error("Cannot open temp_info_pipe for reading"));
temp_data = read(temp_fd);
close(temp_fd);
temp_value = eval(temp_data);
print("Temperature Data: ", temp_value);

# Process the data
threshold = 75; 
if (temp_value > threshold,
    response = "Activate cooling system";
    ,
    response = "Temperature is normal";
);
print("Response: ", response);

# Write the response
response_pipe = "response_pipe";
response_fd = open(response_pipe, "w");
if (response_fd == -1, error("Cannot open response_pipe for writing"));
write(response_fd, response);
close(response_fd);
print("Response written to pipe successfully.");

quit
