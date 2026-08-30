# xv6 File System Extensions

Kernel-level extensions to the **xv6 RISC-V operating system**, focused on two core file-system mechanisms:

1. **Doubly-indirect block addressing** for substantially larger files.
2. **Symbolic links (soft links)** with recursive path resolution and loop protection.

This project modifies xv6's inode/block-mapping and system-call paths while adding user-space programs to validate the new behavior.

---

## Highlights

### Doubly-Indirect File Blocks

The original xv6 inode layout provides direct and single-indirect block addressing. This project adds a second level of indirection while keeping the inode within its fixed size constraint.

The resulting addressing hierarchy is:

```text
inode
 ├── direct blocks
 ├── single-indirect block
 │    └── data blocks
 └── double-indirect block
      ├── indirect block
      │    └── data blocks
      ├── indirect block
      │    └── data blocks
      └── ...
```

With `BSIZE = 1024` bytes and `4`-byte block addresses, each indirect block contains `256` addresses.

The modified layout uses:

```text
11 direct blocks
+ 256 single-indirect blocks
+ 256 × 256 doubly-indirect blocks
= 65,803 data blocks
```

giving a theoretical maximum file size of approximately **64.2 MB**, compared with roughly **268 KB** in the original configuration.

### Symbolic Links

The project also adds symbolic-link support to xv6.

Implemented behavior includes:

- `T_SYMLINK` file type
- `symlink(target, path)` system call
- Target-path storage inside the symbolic-link inode
- Transparent resolution during `open()`
- Recursive link resolution with a **10-level limit**
- `O_NOFOLLOW` to open the link itself
- Correct `stat()` / `unlink()` behavior for links
- Self-referencing link rejection

---

## Implementation

### 1. Doubly-Indirect Block Support

The file-system block mapper was extended so that logical blocks beyond the single-indirect range are resolved through two levels of indirect blocks.

`bmap()` now:

1. Loads or allocates the doubly-indirect block.
2. Selects the required indirect block.
3. Allocates that indirect block when necessary.
4. Selects or allocates the final data block.
5. Returns the corresponding physical block address.

`itrunc()` was correspondingly extended to recursively release:

```text
data blocks
    ↓
indirect blocks
    ↓
doubly-indirect block
```

This prevents leaked blocks when large files are truncated or deleted.

### 2. Symbolic Links

Symbolic links are represented as special inodes containing the target path.

The new `symlink()` system call creates the inode and stores the target path. `open()` was modified to follow links recursively while protecting the kernel from infinite cycles through a maximum resolution depth.

The implementation also distinguishes between:

```text
open("link")              → opens target
open("link", O_NOFOLLOW)  → opens link itself
unlink("link")            → removes link, not target
stat("link")              → reports link itself
```

---

## Key Implementation Files

Only the files central to the extensions are listed here; the repository retains the complete xv6 source tree required to build the system.

### Doubly-Indirect Blocks

| File | Role |
|---|---|
| `kernel/fs.h` | Modified inode addressing layout and file-size constants |
| `kernel/fs.c` | `bmap()` support for doubly-indirect traversal and `itrunc()` block deallocation |
| `user/bigfile.c` | Large-file allocation and read-back integrity test |

### Symbolic Links

| File | Role |
|---|---|
| `kernel/stat.h` | Added `T_SYMLINK` file type |
| `kernel/fcntl.h` | Added `O_NOFOLLOW` |
| `kernel/sysfile.c` | `symlink()` implementation and symbolic-link resolution in `open()` |
| `kernel/syscall.c` | System-call dispatch integration |
| `kernel/syscall.h` | Added symbolic-link system-call number |
| `user/user.h` | User-space declaration for `symlink()` |
| `user/usys.pl` | User/kernel system-call stub generation |
| `user/symlink.c` | Functional and edge-case tests |

---

## Validation

### Large-file test

`user/bigfile.c` creates and writes a **5000-block** file, closes and reopens it, then reads the contents back to verify data integrity.

Representative test flow:

```text
Creating large file
        ↓
Writing 5000 blocks
        ↓
File successfully written
        ↓
Reopen file
        ↓
Read back written data
        ↓
Data verification successful
```

This exercises the newly added doubly-indirect addressing path rather than only the original direct/single-indirect paths.

### Symbolic-link tests

`user/symlink.c` validates:

- Basic symbolic-link creation
- Transparent access to the target
- Self-referencing links
- Recursive-link resolution
- 10-level recursion protection
- `O_NOFOLLOW`
- Unlinking the link without deleting the target

---

## Build & Run

This project follows the standard xv6 RISC-V build workflow.

From the repository root:

```bash
make
make qemu
```

Inside xv6, the added validation programs can be run with:

```text
$ bigfile
$ symlink
```

The project Makefile integrates the additional user programs into the xv6 build.

---

## Repository Structure

```text
xv6-filesystem-extensions/
├── README.md
├── LICENSE
├── Makefile
├── kernel/
│   ├── ... xv6 kernel source ...
│   └── modified file-system / system-call files
├── mkfs/
│   └── ... xv6 filesystem image builder ...
└── user/
    ├── ... xv6 user programs ...
    ├── bigfile.c
    └── symlink.c
```

Generated build artifacts are intentionally excluded from version control.

---

## Technical Takeaways

This project involved modifying xv6 below the application layer, including:

```text
inode layout
    ↓
logical → physical block mapping
    ↓
recursive block allocation/deallocation
    ↓
filesystem metadata and inode types
    ↓
system-call interface
    ↓
path resolution in open()
    ↓
user-space validation
```

The work demonstrates interaction between **file-system data structures, disk-block addressing, kernel memory management, system calls, and edge-case handling** in a small UNIX-like operating system.

---

## Course

**CS344 — Operating Systems Lab**  
Indian Institute of Technology Guwahati

**Assignment 05**

---

## Author

**Manideep Ram Gunje**  
B.Tech. Computer Science and Engineering  
Indian Institute of Technology Guwahati

[GitHub Profile](https://github.com/Manideep-Ram-Gunje)

