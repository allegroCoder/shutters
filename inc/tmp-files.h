#ifndef __TMP_FILES_H__
#define __TMP_FILES_H__

#if defined(__linux) || defined(__APPLE__)
	#include "config.h"
#else
	#include "Path\config.h"
#endif

int create_tmp_filename(char*);
int rm_tmp_file(char*);
int file_exist(char*);
int copy_file(char*, char*);
char* cat_strings(char*, char*);
char* cat_char(char*, char);
void create_tmp_files();
void remove_tmp_files();
void print_file(char*);

#endif
