# Read temperature data
temp_info_pipe = "temp_info_pipe";
temp_fd = open(temp_info_pipe, "r");
if (temp_fd == -1, error("Cannot open temp_info_pipe for reading"));
temp_data = read(temp_fd);
close(temp_fd);
temp_value = eval(temp_data);
print("Temperature Data: ", temp_value);

quit
