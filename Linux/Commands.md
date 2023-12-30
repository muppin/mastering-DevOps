
### Sorting by Modification Time:

- To list core dump files in a directory sorted by modification time (latest first):

  ```bash
  ls -lt /path/to/core_dump_directory
  ```

- To reverse the order (oldest first):

  ```bash
  ls -ltr /path/to/core_dump_directory
  ```

### Sorting by File Size:

- To list core dump files sorted by file size (largest first):

  ```bash
  ls -lS /path/to/core_dump_directory
  ```

### Sorting by File Name:

- To list core dump files in alphabetical order:

  ```bash
  ls -l /path/to/core_dump_directory | sort -k 9
  ```

  Here, `-k 9` specifies the ninth column, which represents the file names.

### Filter by File Extension:

- To list only core dump files (e.g., files with a `.core` extension) in a directory:

  ```bash
  ls /path/to/core_dump_directory/*.core
  ```


### To compare to files

```bash
sdiff -s application1.yaml application2.yaml  // -s to suppress the common lines
```
