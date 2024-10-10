TEMP_INFO_PIPE="/tmp/temp_info_pipe";
BUFSIZE=1024;

{while(1,
  buffer = read(TEMP_INFO_PIPE);
  print(buffer);
  )
}

quit
