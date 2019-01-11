# zig-redismodule
Redis modules for Zig 


## Abstract
This repo contains a zig file that mirrors Redis' official `redismodule.h`.
It was created using `zig translate-c` and it was lightly edited to fix a translation error and to remove a few optional wrappers around the interface API.
It also includes a workaround for a linker bug in macOS Mojave.

In `module.zig` you can find a sample module that makes use of `redismodule.zig`.

This all was done using Zig 0.3.0 and Redis 5.0

## Building 

To build the module for your platform:
`$ zig build-lib module.zig`

To cross-compile for linux:
`$ zig build-lib module.zig --target-os linux --target-arch x86_64`

To load the module in Redis (using `redis-cli`):
```
> MODULE LOAD /path/to/module.so.0
OK
> test.hello
Hello World!
```
