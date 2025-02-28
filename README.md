To build the image, run

```sh
docker build -t dd-comptime .
```

## Error message on OrbStack with Rosetta
```
+] Building 37.5s (9/9) FINISHED                                                                                                                                 docker:orbstack
 => [internal] load build definition from Dockerfile                                                                                                                         0.0s
 => => transferring dockerfile: 353B                                                                                                                                         0.0s
 => WARN: FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "amd64" (line 1)                                                               0.0s
 => [internal] load metadata for docker.io/library/golang:1.23.1-alpine3.20                                                                                                  0.9s
 => [auth] library/golang:pull token for registry-1.docker.io                                                                                                                0.0s
 => [internal] load .dockerignore                                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                                              0.0s
 => CACHED [stage-0 1/4] FROM docker.io/library/golang:1.23.1-alpine3.20@sha256:ac67716dd016429be8d4c2c53a248d7bcdf06d34127d3dc451bda6aa5a87bc06                             0.0s
 => [internal] load build context                                                                                                                                            0.0s
 => => transferring context: 710B                                                                                                                                            0.0s
 => [stage-0 2/4] RUN go install github.com/DataDog/orchestrion@v1.1.0                                                                                                      25.7s
 => [stage-0 3/4] WORKDIR /app                                                                                                                                               0.1s
 => ERROR [stage-0 4/4] RUN --mount=type=bind,target=/app go build -o main /app                                                                                             10.6s
------
 > [stage-0 4/4] RUN --mount=type=bind,target=/app go build -o main /app:
9.511 failed to resolve argv0 ("[rosetta]") of 1: exec: "[rosetta]": executable file not found in $PATH
9.511 go: error obtaining buildID for go tool compile: exit status 255
------

 1 warning found (use docker --debug to expand):
 - FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "amd64" (line 1)
Dockerfile:10
--------------------
   8 |
   9 |     # Build the application
  10 | >>> RUN --mount=type=bind,target=/app go build -o main /app
  11 |
  12 |     # Run the binary
--------------------
ERROR: failed to solve: process "/bin/sh -c go build -o main /app" did not complete successfully: exit code: 1
```

## Error message on OrbStack with QEMU

```
$ docker build -t dd-comptime .
[+] Building 35.3s (9/9) FINISHED                                                                                                                                 docker:orbstack
 => [internal] load build definition from Dockerfile                                                                                                                         0.0s
 => => transferring dockerfile: 312B                                                                                                                                         0.0s
 => WARN: FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "amd64" (line 1)                                                               0.0s
 => [internal] load metadata for docker.io/library/golang:1.23.1-alpine3.20                                                                                                  8.8s
 => [auth] library/golang:pull token for registry-1.docker.io                                                                                                                0.0s
 => [internal] load .dockerignore                                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                                              0.0s
 => [stage-0 1/4] FROM docker.io/library/golang:1.23.1-alpine3.20@sha256:ac67716dd016429be8d4c2c53a248d7bcdf06d34127d3dc451bda6aa5a87bc06                                    0.0s
 => [internal] load build context                                                                                                                                            0.0s
 => => transferring context: 31.97kB                                                                                                                                         0.0s
 => CACHED [stage-0 2/4] RUN go install github.com/DataDog/orchestrion@v1.1.0                                                                                                0.0s
 => CACHED [stage-0 3/4] WORKDIR /app                                                                                                                                        0.0s
 => ERROR [stage-0 4/4] RUN --mount=type=bind,target=/app go build -o main /app                                                                                             26.4s
------
 > [stage-0 4/4] RUN --mount=type=bind,target=/app go build -o main /app:
24.76 failed to resolve argv0 ("[qemu]") of 1: exec: "[qemu]": executable file not found in $PATH
24.76 go: error obtaining buildID for go tool compile: exit status 255
24.77 failed to resolve argv0 ("[qemu]") of 1: exec: "[qemu]": executable file not found in $PATH
24.77 go: error obtaining buildID for go tool compile: exit status 255
24.77 failed to resolve argv0 ("[qemu]") of 1: exec: "[qemu]": executable file not found in $PATH
24.77 go: error obtaining buildID for go tool compile: exit status 255
------

 1 warning found (use docker --debug to expand):
 - FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "amd64" (line 1)
Dockerfile:9
--------------------
   7 |     ENV GOFLAGS="'-toolexec=orchestrion toolexec'"
   8 |
   9 | >>> RUN --mount=type=bind,target=/app go build -o main /app
  10 |
  11 |     CMD ["./main"]
--------------------
ERROR: failed to solve: process "/bin/sh -c go build -o main /app" did not complete successfully: exit code: 1
```

## Error message on Docker Desktop with Rosetta

```
$ docker build -t dd-comptime .
[+] Building 201.0s (9/9) FINISHED                                                                                                                           docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                         0.0s
 => => transferring dockerfile: 353B                                                                                                                                         0.0s
 => WARN: FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "amd64" (line 1)                                                               0.0s
 => [internal] load metadata for docker.io/library/golang:1.23.1-alpine3.20                                                                                                  0.8s
 => [auth] library/golang:pull token for registry-1.docker.io                                                                                                                0.0s
 => [internal] load .dockerignore                                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                                              0.0s
 => [stage-0 1/4] FROM docker.io/library/golang:1.23.1-alpine3.20@sha256:ac67716dd016429be8d4c2c53a248d7bcdf06d34127d3dc451bda6aa5a87bc06                                    0.0s
 => => resolve docker.io/library/golang:1.23.1-alpine3.20@sha256:ac67716dd016429be8d4c2c53a248d7bcdf06d34127d3dc451bda6aa5a87bc06                                            0.0s
 => [internal] load build context                                                                                                                                            0.0s
 => => transferring context: 3.83kB                                                                                                                                          0.0s
 => CACHED [stage-0 2/4] RUN go install github.com/DataDog/orchestrion@v1.1.0                                                                                                0.0s
 => CACHED [stage-0 3/4] WORKDIR /app                                                                                                                                        0.0s
 => ERROR [stage-0 4/4] RUN --mount=type=bind,target=/app go build -o main /app                                                                                            200.1s
------
 > [stage-0 4/4] RUN --mount=type=bind,target=/app go build -o main /app:
200.0 # dd-orchestrion-rosetta
200.0 resolving woven dependency on gopkg.in/DataDog/dd-trace-go.v1/ddtrace/tracer: -: # log/slog/internal/buffer
200.0 unexpected fault address 0xeffff7ce4520
200.0 fatal error: fault
200.0 [signal SIGSEGV: segmentation violation code=0x1 addr=0xeffff7ce4520 pc=0x48587e]
200.0
200.0 goroutine 52 gp=0xc000674c40 m=3 mp=0xc000100008 [running]:
200.0 runtime.throw({0xe279fd?, 0x0?})
200.0 	runtime/panic.go:1067 +0x48 fp=0xc0008d34c0 sp=0xc0008d3490 pc=0x480668
200.0 runtime.sigpanic()
200.0 	runtime/signal_unix.go:914 +0x26c fp=0xc0008d3520 sp=0xc0008d34c0 pc=0x48220c
200.0 gogo()
200.0 	runtime/asm_amd64.s:423 +0x3e fp=0xc0008d3528 sp=0xc0008d3520 pc=0x48587e
200.0 created by cmd/compile/internal/gc.compileFunctions.func3 in goroutine 49
200.0 	cmd/compile/internal/gc/compile.go:169 +0x247
200.0
200.0 goroutine 1 gp=0xc0000061c0 m=nil [semacquire]:
200.0 runtime.gopark(0xc0000061c0?, 0x0?, 0x0?, 0x23?, 0xc0006678e0?)
200.0 	runtime/proc.go:424 +0xce fp=0xc000667898 sp=0xc000667878 pc=0x48078e
200.0 runtime.goparkunlock(...)
200.0 	runtime/proc.go:430
200.0 runtime.semacquire1(0xc0006f1b28, 0x0, 0x1, 0x0, 0x12)
200.0 	runtime/sema.go:178 +0x225 fp=0xc000667900 sp=0xc000667898 pc=0x45aa05
200.0 sync.runtime_Semacquire(0xc00062c500?)
200.0 	runtime/sema.go:71 +0x25 fp=0xc000667938 sp=0xc000667900 pc=0x481c85
200.0 sync.(*WaitGroup).Wait(0xc000657e00?)
200.0 	sync/waitgroup.go:118 +0x48 fp=0xc000667960 sp=0xc000667938 pc=0x4a0b68
200.0 cmd/compile/internal/gc.compileFunctions(0x0)
200.0 	cmd/compile/internal/gc/compile.go:200 +0x23d fp=0xc0006679d0 sp=0xc000667960 pc=0xd1e69d
200.0 cmd/compile/internal/gc.Main(0xe68358)
200.0 	cmd/compile/internal/gc/main.go:306 +0x12ba fp=0xc000667ef0 sp=0xc0006679d0 pc=0xd1fffa
200.0 main.main()
200.0 	cmd/compile/main.go:57 +0xf9 fp=0xc000667f50 sp=0xc000667ef0 pc=0xd49959
200.0 runtime.main()
200.0 	runtime/proc.go:272 +0x28b fp=0xc000667fe0 sp=0xc000667f50 pc=0x446b4b
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc000667fe8 sp=0xc000667fe0 pc=0x488581
200.0
200.0 goroutine 2 gp=0xc000006700 m=nil [force gc (idle)]:
200.0 runtime.gopark(0x0?, 0x0?, 0x0?, 0x0?, 0x0?)
200.0 	runtime/proc.go:424 +0xce fp=0xc00006cfa8 sp=0xc00006cf88 pc=0x48078e
200.0 runtime.goparkunlock(...)
200.0 	runtime/proc.go:430
200.0 runtime.forcegchelper()
200.0 	runtime/proc.go:337 +0xb3 fp=0xc00006cfe0 sp=0xc00006cfa8 pc=0x446e93
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc00006cfe8 sp=0xc00006cfe0 pc=0x488581
200.0 created by runtime.init.7 in goroutine 1
200.0 	runtime/proc.go:325 +0x1a
200.0
200.0 goroutine 3 gp=0xc000006c40 m=nil [GC sweep wait]:
200.0 runtime.gopark(0x0?, 0x0?, 0x0?, 0x0?, 0x0?)
200.0 	runtime/proc.go:424 +0xce fp=0xc00006d750 sp=0xc00006d730 pc=0x48078e
200.0 runtime.goparkunlock(...)
200.0 	runtime/proc.go:430
200.0 runtime.bgsweep(0xc00007e000)
200.0 	runtime/mgcsweep.go:277 +0x94 fp=0xc00006d7c8 sp=0xc00006d750 pc=0x42b154
200.0 runtime.gcenable.gowrap1()
200.0 	runtime/mgc.go:203 +0x25 fp=0xc00006d7e0 sp=0xc00006d7c8 pc=0x41e305
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc00006d7e8 sp=0xc00006d7e0 pc=0x488581
200.0 created by runtime.gcenable in goroutine 1
200.0 	runtime/mgc.go:203 +0x66
200.0
200.0 goroutine 4 gp=0xc000006e00 m=nil [GC scavenge wait]:
200.0 runtime.gopark(0xc00007e000?, 0xf93328?, 0x1?, 0x0?, 0xc000006e00?)
200.0 	runtime/proc.go:424 +0xce fp=0xc00006df78 sp=0xc00006df58 pc=0x48078e
200.0 runtime.goparkunlock(...)
200.0 	runtime/proc.go:430
200.0 runtime.(*scavengerState).park(0x1587b60)
200.0 	runtime/mgcscavenge.go:425 +0x49 fp=0xc00006dfa8 sp=0xc00006df78 pc=0x4288e9
200.0 runtime.bgscavenge(0xc00007e000)
200.0 	runtime/mgcscavenge.go:653 +0x3c fp=0xc00006dfc8 sp=0xc00006dfa8 pc=0x428e5c
200.0 runtime.gcenable.gowrap2()
200.0 	runtime/mgc.go:204 +0x25 fp=0xc00006dfe0 sp=0xc00006dfc8 pc=0x41e2a5
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc00006dfe8 sp=0xc00006dfe0 pc=0x488581
200.0 created by runtime.gcenable in goroutine 1
200.0 	runtime/mgc.go:204 +0xa5
200.0
200.0 goroutine 17 gp=0xc000204380 m=nil [finalizer wait]:
200.0 runtime.gopark(0x7fffb8cf0a88?, 0x400000?, 0x13?, 0x0?, 0xc00006c700?)
200.0 	runtime/proc.go:424 +0xce fp=0xc00006c620 sp=0xc00006c600 pc=0x48078e
200.0 runtime.runfinq()
200.0 	runtime/mfinal.go:193 +0x107 fp=0xc00006c7e0 sp=0xc00006c620 pc=0x41d327
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc00006c7e8 sp=0xc00006c7e0 pc=0x488581
200.0 created by runtime.createfing in goroutine 1
200.0 	runtime/mfinal.go:163 +0x3d
200.0
200.0 goroutine 49 gp=0xc000674700 m=nil [select]:
200.0 runtime.gopark(0xc0008c27b0?, 0x2?, 0x8?, 0x0?, 0xc0008c2724?)
200.0 	runtime/proc.go:424 +0xce fp=0xc0008c25b8 sp=0xc0008c2598 pc=0x48078e
200.0 runtime.selectgo(0xc0008c27b0, 0xc0008c2720, 0x0?, 0x0, 0xd80640?, 0x1)
200.0 	runtime/select.go:335 +0x7ba fp=0xc0008c26e0 sp=0xc0008c25b8 pc=0x45993a
200.0 cmd/compile/internal/gc.compileFunctions.func3()
200.0 	cmd/compile/internal/gc/compile.go:158 +0x125 fp=0xc0008c27e0 sp=0xc0008c26e0 pc=0xd1ea05
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc0008c27e8 sp=0xc0008c27e0 pc=0x488581
200.0 created by cmd/compile/internal/gc.compileFunctions in goroutine 1
200.0 	cmd/compile/internal/gc/compile.go:151 +0xf4
200.0
200.0 goroutine 50 gp=0xc0006748c0 m=nil [runnable]:
200.0 runtime.asyncPreempt2()
200.0 	runtime/preempt.go:308 +0x39 fp=0xc0002b1608 sp=0xc0002b15e8 pc=0x4456d9
200.0 runtime.asyncPreempt()
200.0 	runtime/preempt_amd64.s:53 +0xdb fp=0xc0002b1790 sp=0xc0002b1608 pc=0x489adb
200.0 cmd/compile/internal/ssa.(*Cache).allocValueSlice(...)
200.0 	cmd/compile/internal/ssa/allocators.go:20
200.0 cmd/compile/internal/ssa.liveValues(0xc0006be9c0, {0xc000222320, 0x3, 0x1?})
200.0 	cmd/compile/internal/ssa/deadcode.go:58 +0x22e fp=0xc0002b19c8 sp=0xc0002b1790 pc=0x76a06e
200.0 cmd/compile/internal/ssa.deadcode(0xc0006be9c0)
200.0 	cmd/compile/internal/ssa/deadcode.go:205 +0x36f fp=0xc0002b1e48 sp=0xc0002b19c8 pc=0x76b56f
200.0 cmd/compile/internal/ssa.Compile(0xc0006be9c0)
200.0 	cmd/compile/internal/ssa/compile.go:97 +0xa54 fp=0xc0002b5af8 sp=0xc0002b1e48 pc=0x762094
200.0 cmd/compile/internal/ssagen.buildssa(0xc0008528c0, 0x3, 0x0)
200.0 	cmd/compile/internal/ssagen/ssa.go:591 +0x26dd fp=0xc0002b5ea0 sp=0xc0002b5af8 pc=0xb1af1d
200.0 cmd/compile/internal/ssagen.Compile(0xc0008528c0, 0x3, 0x0?)
200.0 	cmd/compile/internal/ssagen/pgen.go:302 +0x88 fp=0xc0002b5f70 sp=0xc0002b5ea0 pc=0xb115e8
200.0 cmd/compile/internal/gc.compileFunctions.func5.1(0x0?)
200.0 	cmd/compile/internal/gc/compile.go:188 +0x38 fp=0xc0002b5fb0 sp=0xc0002b5f70 pc=0xd1e858
200.0 cmd/compile/internal/gc.compileFunctions.func3.1()
200.0 	cmd/compile/internal/gc/compile.go:170 +0x30 fp=0xc0002b5fe0 sp=0xc0002b5fb0 pc=0xd1ec50
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc0002b5fe8 sp=0xc0002b5fe0 pc=0x488581
200.0 created by cmd/compile/internal/gc.compileFunctions.func3 in goroutine 49
200.0 	cmd/compile/internal/gc/compile.go:169 +0x247
200.0
200.0 goroutine 51 gp=0xc000674a80 m=nil [runnable]:
200.0 runtime.asyncPreempt2()
200.0 	runtime/preempt.go:308 +0x39 fp=0xc0005bd608 sp=0xc0005bd5e8 pc=0x4456d9
200.0 runtime.asyncPreempt()
200.0 	runtime/preempt_amd64.s:53 +0xdb fp=0xc0005bd790 sp=0xc0005bd608 pc=0x489adb
200.0 cmd/compile/internal/ssa.liveValues(0xc00054b6c0, {0xc0001b73f4, 0x3, 0x3f?})
200.0 	cmd/compile/internal/ssa/deadcode.go:81 +0x11c4 fp=0xc0005bd9c8 sp=0xc0005bd790 pc=0x76b004
200.0 cmd/compile/internal/ssa.deadcode(0xc00054b6c0)
200.0 	cmd/compile/internal/ssa/deadcode.go:205 +0x36f fp=0xc0005bde48 sp=0xc0005bd9c8 pc=0x76b56f
200.0 cmd/compile/internal/ssa.Compile(0xc00054b6c0)
200.0 	cmd/compile/internal/ssa/compile.go:97 +0xa54 fp=0xc0005c1af8 sp=0xc0005bde48 pc=0x762094
200.0 cmd/compile/internal/ssagen.buildssa(0xc0006c2f00, 0x2, 0x0)
200.0 	cmd/compile/internal/ssagen/ssa.go:591 +0x26dd fp=0xc0005c1ea0 sp=0xc0005c1af8 pc=0xb1af1d
200.0 cmd/compile/internal/ssagen.Compile(0xc0006c2f00, 0x2, 0x0?)
200.0 	cmd/compile/internal/ssagen/pgen.go:302 +0x88 fp=0xc0005c1f70 sp=0xc0005c1ea0 pc=0xb115e8
200.0 cmd/compile/internal/gc.compileFunctions.func5.1(0x0?)
200.0 	cmd/compile/internal/gc/compile.go:188 +0x38 fp=0xc0005c1fb0 sp=0xc0005c1f70 pc=0xd1e858
200.0 cmd/compile/internal/gc.compileFunctions.func3.1()
200.0 	cmd/compile/internal/gc/compile.go:170 +0x30 fp=0xc0005c1fe0 sp=0xc0005c1fb0 pc=0xd1ec50
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc0005c1fe8 sp=0xc0005c1fe0 pc=0x488581
200.0 created by cmd/compile/internal/gc.compileFunctions.func3 in goroutine 49
200.0 	cmd/compile/internal/gc/compile.go:169 +0x247
200.0
200.0 goroutine 5 gp=0xc000006fc0 m=nil [runnable]:
200.0 runtime.asyncPreempt2()
200.0 	runtime/preempt.go:308 +0x39 fp=0xc00014f608 sp=0xc00014f5e8 pc=0x4456d9
200.0 runtime.asyncPreempt()
200.0 	runtime/preempt_amd64.s:53 +0xdb fp=0xc00014f790 sp=0xc00014f608 pc=0x489adb
200.0 cmd/compile/internal/ssa.liveValues(0xc000126000, {0xc000122030, 0x3, 0x1?})
200.0 	cmd/compile/internal/ssa/deadcode.go:81 +0x11c4 fp=0xc00014f9c8 sp=0xc00014f790 pc=0x76b004
200.0 cmd/compile/internal/ssa.deadcode(0xc000126000)
200.0 	cmd/compile/internal/ssa/deadcode.go:205 +0x36f fp=0xc00014fe48 sp=0xc00014f9c8 pc=0x76b56f
200.0 cmd/compile/internal/ssa.Compile(0xc000126000)
200.0 	cmd/compile/internal/ssa/compile.go:97 +0xa54 fp=0xc000153af8 sp=0xc00014fe48 pc=0x762094
200.0 cmd/compile/internal/ssagen.buildssa(0xc0006edcc0, 0x0, 0x0)
200.0 	cmd/compile/internal/ssagen/ssa.go:591 +0x26dd fp=0xc000153ea0 sp=0xc000153af8 pc=0xb1af1d
200.0 cmd/compile/internal/ssagen.Compile(0xc0006edcc0, 0x0, 0x0?)
200.0 	cmd/compile/internal/ssagen/pgen.go:302 +0x88 fp=0xc000153f70 sp=0xc000153ea0 pc=0xb115e8
200.0 cmd/compile/internal/gc.compileFunctions.func5.1(0x0?)
200.0 	cmd/compile/internal/gc/compile.go:188 +0x38 fp=0xc000153fb0 sp=0xc000153f70 pc=0xd1e858
200.0 cmd/compile/internal/gc.compileFunctions.func3.1()
200.0 	cmd/compile/internal/gc/compile.go:170 +0x30 fp=0xc000153fe0 sp=0xc000153fb0 pc=0xd1ec50
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc000153fe8 sp=0xc000153fe0 pc=0x488581
200.0 created by cmd/compile/internal/gc.compileFunctions.func3 in goroutine 49
200.0 	cmd/compile/internal/gc/compile.go:169 +0x247
200.0 exit status 2
200.0 -: # log/slog/internal/buffer
200.0 unexpected fault address 0xeffff7ce4520
200.0 fatal error: fault
200.0 [signal SIGSEGV: segmentation violation code=0x1 addr=0xeffff7ce4520 pc=0x48587e]
200.0
200.0 goroutine 52 gp=0xc000674c40 m=3 mp=0xc000100008 [running]:
200.0 runtime.throw({0xe279fd?, 0x0?})
200.0 	runtime/panic.go:1067 +0x48 fp=0xc0008d34c0 sp=0xc0008d3490 pc=0x480668
200.0 runtime.sigpanic()
200.0 	runtime/signal_unix.go:914 +0x26c fp=0xc0008d3520 sp=0xc0008d34c0 pc=0x48220c
200.0 gogo()
200.0 	runtime/asm_amd64.s:423 +0x3e fp=0xc0008d3528 sp=0xc0008d3520 pc=0x48587e
200.0 created by cmd/compile/internal/gc.compileFunctions.func3 in goroutine 49
200.0 	cmd/compile/internal/gc/compile.go:169 +0x247
200.0
200.0 goroutine 1 gp=0xc0000061c0 m=nil [semacquire]:
200.0 runtime.gopark(0xc0000061c0?, 0x0?, 0x0?, 0x23?, 0xc0006678e0?)
200.0 	runtime/proc.go:424 +0xce fp=0xc000667898 sp=0xc000667878 pc=0x48078e
200.0 runtime.goparkunlock(...)
200.0 	runtime/proc.go:430
200.0 runtime.semacquire1(0xc0006f1b28, 0x0, 0x1, 0x0, 0x12)
200.0 	runtime/sema.go:178 +0x225 fp=0xc000667900 sp=0xc000667898 pc=0x45aa05
200.0 sync.runtime_Semacquire(0xc00062c500?)
200.0 	runtime/sema.go:71 +0x25 fp=0xc000667938 sp=0xc000667900 pc=0x481c85
200.0 sync.(*WaitGroup).Wait(0xc000657e00?)
200.0 	sync/waitgroup.go:118 +0x48 fp=0xc000667960 sp=0xc000667938 pc=0x4a0b68
200.0 cmd/compile/internal/gc.compileFunctions(0x0)
200.0 	cmd/compile/internal/gc/compile.go:200 +0x23d fp=0xc0006679d0 sp=0xc000667960 pc=0xd1e69d
200.0 cmd/compile/internal/gc.Main(0xe68358)
200.0 	cmd/compile/internal/gc/main.go:306 +0x12ba fp=0xc000667ef0 sp=0xc0006679d0 pc=0xd1fffa
200.0 main.main()
200.0 	cmd/compile/main.go:57 +0xf9 fp=0xc000667f50 sp=0xc000667ef0 pc=0xd49959
200.0 runtime.main()
200.0 	runtime/proc.go:272 +0x28b fp=0xc000667fe0 sp=0xc000667f50 pc=0x446b4b
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc000667fe8 sp=0xc000667fe0 pc=0x488581
200.0
200.0 goroutine 2 gp=0xc000006700 m=nil [force gc (idle)]:
200.0 runtime.gopark(0x0?, 0x0?, 0x0?, 0x0?, 0x0?)
200.0 	runtime/proc.go:424 +0xce fp=0xc00006cfa8 sp=0xc00006cf88 pc=0x48078e
200.0 runtime.goparkunlock(...)
200.0 	runtime/proc.go:430
200.0 runtime.forcegchelper()
200.0 	runtime/proc.go:337 +0xb3 fp=0xc00006cfe0 sp=0xc00006cfa8 pc=0x446e93
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc00006cfe8 sp=0xc00006cfe0 pc=0x488581
200.0 created by runtime.init.7 in goroutine 1
200.0 	runtime/proc.go:325 +0x1a
200.0
200.0 goroutine 3 gp=0xc000006c40 m=nil [GC sweep wait]:
200.0 runtime.gopark(0x0?, 0x0?, 0x0?, 0x0?, 0x0?)
200.0 	runtime/proc.go:424 +0xce fp=0xc00006d750 sp=0xc00006d730 pc=0x48078e
200.0 runtime.goparkunlock(...)
200.0 	runtime/proc.go:430
200.0 runtime.bgsweep(0xc00007e000)
200.0 	runtime/mgcsweep.go:277 +0x94 fp=0xc00006d7c8 sp=0xc00006d750 pc=0x42b154
200.0 runtime.gcenable.gowrap1()
200.0 	runtime/mgc.go:203 +0x25 fp=0xc00006d7e0 sp=0xc00006d7c8 pc=0x41e305
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc00006d7e8 sp=0xc00006d7e0 pc=0x488581
200.0 created by runtime.gcenable in goroutine 1
200.0 	runtime/mgc.go:203 +0x66
200.0
200.0 goroutine 4 gp=0xc000006e00 m=nil [GC scavenge wait]:
200.0 runtime.gopark(0xc00007e000?, 0xf93328?, 0x1?, 0x0?, 0xc000006e00?)
200.0 	runtime/proc.go:424 +0xce fp=0xc00006df78 sp=0xc00006df58 pc=0x48078e
200.0 runtime.goparkunlock(...)
200.0 	runtime/proc.go:430
200.0 runtime.(*scavengerState).park(0x1587b60)
200.0 	runtime/mgcscavenge.go:425 +0x49 fp=0xc00006dfa8 sp=0xc00006df78 pc=0x4288e9
200.0 runtime.bgscavenge(0xc00007e000)
200.0 	runtime/mgcscavenge.go:653 +0x3c fp=0xc00006dfc8 sp=0xc00006dfa8 pc=0x428e5c
200.0 runtime.gcenable.gowrap2()
200.0 	runtime/mgc.go:204 +0x25 fp=0xc00006dfe0 sp=0xc00006dfc8 pc=0x41e2a5
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc00006dfe8 sp=0xc00006dfe0 pc=0x488581
200.0 created by runtime.gcenable in goroutine 1
200.0 	runtime/mgc.go:204 +0xa5
200.0
200.0 goroutine 17 gp=0xc000204380 m=nil [finalizer wait]:
200.0 runtime.gopark(0x7fffb8cf0a88?, 0x400000?, 0x13?, 0x0?, 0xc00006c700?)
200.0 	runtime/proc.go:424 +0xce fp=0xc00006c620 sp=0xc00006c600 pc=0x48078e
200.0 runtime.runfinq()
200.0 	runtime/mfinal.go:193 +0x107 fp=0xc00006c7e0 sp=0xc00006c620 pc=0x41d327
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc00006c7e8 sp=0xc00006c7e0 pc=0x488581
200.0 created by runtime.createfing in goroutine 1
200.0 	runtime/mfinal.go:163 +0x3d
200.0
200.0 goroutine 49 gp=0xc000674700 m=nil [select]:
200.0 runtime.gopark(0xc0008c27b0?, 0x2?, 0x8?, 0x0?, 0xc0008c2724?)
200.0 	runtime/proc.go:424 +0xce fp=0xc0008c25b8 sp=0xc0008c2598 pc=0x48078e
200.0 runtime.selectgo(0xc0008c27b0, 0xc0008c2720, 0x0?, 0x0, 0xd80640?, 0x1)
200.0 	runtime/select.go:335 +0x7ba fp=0xc0008c26e0 sp=0xc0008c25b8 pc=0x45993a
200.0 cmd/compile/internal/gc.compileFunctions.func3()
200.0 	cmd/compile/internal/gc/compile.go:158 +0x125 fp=0xc0008c27e0 sp=0xc0008c26e0 pc=0xd1ea05
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc0008c27e8 sp=0xc0008c27e0 pc=0x488581
200.0 created by cmd/compile/internal/gc.compileFunctions in goroutine 1
200.0 	cmd/compile/internal/gc/compile.go:151 +0xf4
200.0
200.0 goroutine 50 gp=0xc0006748c0 m=nil [runnable]:
200.0 runtime.asyncPreempt2()
200.0 	runtime/preempt.go:308 +0x39 fp=0xc0002b1608 sp=0xc0002b15e8 pc=0x4456d9
200.0 runtime.asyncPreempt()
200.0 	runtime/preempt_amd64.s:53 +0xdb fp=0xc0002b1790 sp=0xc0002b1608 pc=0x489adb
200.0 cmd/compile/internal/ssa.(*Cache).allocValueSlice(...)
200.0 	cmd/compile/internal/ssa/allocators.go:20
200.0 cmd/compile/internal/ssa.liveValues(0xc0006be9c0, {0xc000222320, 0x3, 0x1?})
200.0 	cmd/compile/internal/ssa/deadcode.go:58 +0x22e fp=0xc0002b19c8 sp=0xc0002b1790 pc=0x76a06e
200.0 cmd/compile/internal/ssa.deadcode(0xc0006be9c0)
200.0 	cmd/compile/internal/ssa/deadcode.go:205 +0x36f fp=0xc0002b1e48 sp=0xc0002b19c8 pc=0x76b56f
200.0 cmd/compile/internal/ssa.Compile(0xc0006be9c0)
200.0 	cmd/compile/internal/ssa/compile.go:97 +0xa54 fp=0xc0002b5af8 sp=0xc0002b1e48 pc=0x762094
200.0 cmd/compile/internal/ssagen.buildssa(0xc0008528c0, 0x3, 0x0)
200.0 	cmd/compile/internal/ssagen/ssa.go:591 +0x26dd fp=0xc0002b5ea0 sp=0xc0002b5af8 pc=0xb1af1d
200.0 cmd/compile/internal/ssagen.Compile(0xc0008528c0, 0x3, 0x0?)
200.0 	cmd/compile/internal/ssagen/pgen.go:302 +0x88 fp=0xc0002b5f70 sp=0xc0002b5ea0 pc=0xb115e8
200.0 cmd/compile/internal/gc.compileFunctions.func5.1(0x0?)
200.0 	cmd/compile/internal/gc/compile.go:188 +0x38 fp=0xc0002b5fb0 sp=0xc0002b5f70 pc=0xd1e858
200.0 cmd/compile/internal/gc.compileFunctions.func3.1()
200.0 	cmd/compile/internal/gc/compile.go:170 +0x30 fp=0xc0002b5fe0 sp=0xc0002b5fb0 pc=0xd1ec50
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc0002b5fe8 sp=0xc0002b5fe0 pc=0x488581
200.0 created by cmd/compile/internal/gc.compileFunctions.func3 in goroutine 49
200.0 	cmd/compile/internal/gc/compile.go:169 +0x247
200.0
200.0 goroutine 51 gp=0xc000674a80 m=nil [runnable]:
200.0 runtime.asyncPreempt2()
200.0 	runtime/preempt.go:308 +0x39 fp=0xc0005bd608 sp=0xc0005bd5e8 pc=0x4456d9
200.0 runtime.asyncPreempt()
200.0 	runtime/preempt_amd64.s:53 +0xdb fp=0xc0005bd790 sp=0xc0005bd608 pc=0x489adb
200.0 cmd/compile/internal/ssa.liveValues(0xc00054b6c0, {0xc0001b73f4, 0x3, 0x3f?})
200.0 	cmd/compile/internal/ssa/deadcode.go:81 +0x11c4 fp=0xc0005bd9c8 sp=0xc0005bd790 pc=0x76b004
200.0 cmd/compile/internal/ssa.deadcode(0xc00054b6c0)
200.0 	cmd/compile/internal/ssa/deadcode.go:205 +0x36f fp=0xc0005bde48 sp=0xc0005bd9c8 pc=0x76b56f
200.0 cmd/compile/internal/ssa.Compile(0xc00054b6c0)
200.0 	cmd/compile/internal/ssa/compile.go:97 +0xa54 fp=0xc0005c1af8 sp=0xc0005bde48 pc=0x762094
200.0 cmd/compile/internal/ssagen.buildssa(0xc0006c2f00, 0x2, 0x0)
200.0 	cmd/compile/internal/ssagen/ssa.go:591 +0x26dd fp=0xc0005c1ea0 sp=0xc0005c1af8 pc=0xb1af1d
200.0 cmd/compile/internal/ssagen.Compile(0xc0006c2f00, 0x2, 0x0?)
200.0 	cmd/compile/internal/ssagen/pgen.go:302 +0x88 fp=0xc0005c1f70 sp=0xc0005c1ea0 pc=0xb115e8
200.0 cmd/compile/internal/gc.compileFunctions.func5.1(0x0?)
200.0 	cmd/compile/internal/gc/compile.go:188 +0x38 fp=0xc0005c1fb0 sp=0xc0005c1f70 pc=0xd1e858
200.0 cmd/compile/internal/gc.compileFunctions.func3.1()
200.0 	cmd/compile/internal/gc/compile.go:170 +0x30 fp=0xc0005c1fe0 sp=0xc0005c1fb0 pc=0xd1ec50
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc0005c1fe8 sp=0xc0005c1fe0 pc=0x488581
200.0 created by cmd/compile/internal/gc.compileFunctions.func3 in goroutine 49
200.0 	cmd/compile/internal/gc/compile.go:169 +0x247
200.0
200.0 goroutine 5 gp=0xc000006fc0 m=nil [runnable]:
200.0 runtime.asyncPreempt2()
200.0 	runtime/preempt.go:308 +0x39 fp=0xc00014f608 sp=0xc00014f5e8 pc=0x4456d9
200.0 runtime.asyncPreempt()
200.0 	runtime/preempt_amd64.s:53 +0xdb fp=0xc00014f790 sp=0xc00014f608 pc=0x489adb
200.0 cmd/compile/internal/ssa.liveValues(0xc000126000, {0xc000122030, 0x3, 0x1?})
200.0 	cmd/compile/internal/ssa/deadcode.go:81 +0x11c4 fp=0xc00014f9c8 sp=0xc00014f790 pc=0x76b004
200.0 cmd/compile/internal/ssa.deadcode(0xc000126000)
200.0 	cmd/compile/internal/ssa/deadcode.go:205 +0x36f fp=0xc00014fe48 sp=0xc00014f9c8 pc=0x76b56f
200.0 cmd/compile/internal/ssa.Compile(0xc000126000)
200.0 	cmd/compile/internal/ssa/compile.go:97 +0xa54 fp=0xc000153af8 sp=0xc00014fe48 pc=0x762094
200.0 cmd/compile/internal/ssagen.buildssa(0xc0006edcc0, 0x0, 0x0)
200.0 	cmd/compile/internal/ssagen/ssa.go:591 +0x26dd fp=0xc000153ea0 sp=0xc000153af8 pc=0xb1af1d
200.0 cmd/compile/internal/ssagen.Compile(0xc0006edcc0, 0x0, 0x0?)
200.0 	cmd/compile/internal/ssagen/pgen.go:302 +0x88 fp=0xc000153f70 sp=0xc000153ea0 pc=0xb115e8
200.0 cmd/compile/internal/gc.compileFunctions.func5.1(0x0?)
200.0 	cmd/compile/internal/gc/compile.go:188 +0x38 fp=0xc000153fb0 sp=0xc000153f70 pc=0xd1e858
200.0 cmd/compile/internal/gc.compileFunctions.func3.1()
200.0 	cmd/compile/internal/gc/compile.go:170 +0x30 fp=0xc000153fe0 sp=0xc000153fb0 pc=0xd1ec50
200.0 runtime.goexit({})
200.0 	runtime/asm_amd64.s:1700 +0x1 fp=0xc000153fe8 sp=0xc000153fe0 pc=0x488581
200.0 created by cmd/compile/internal/gc.compileFunctions.func3 in goroutine 49
200.0 	cmd/compile/internal/gc/compile.go:169 +0x247
200.0 exit status 2
------

 1 warning found (use docker --debug to expand):
 - FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "amd64" (line 1)
Dockerfile:10
--------------------
   8 |
   9 |     # Build the application
  10 | >>> RUN --mount=type=bind,target=/app go build -o main /app
  11 |
  12 |     # Run the binary
--------------------
ERROR: failed to solve: process "/bin/sh -c go build -o main /app" did not complete successfully: exit code: 1
```

## Error message on Docker Desktop with QEMU or [Docker VMM](https://docs.docker.com/desktop/features/vmm/)

```
$ docker build -t dd-comptime .
[+] Building 39.6s (9/9) FINISHED                                                                                                                            docker:desktop-linux
 => [internal] load build definition from Dockerfile                                                                                                                         0.0s
 => => transferring dockerfile: 312B                                                                                                                                         0.0s
 => WARN: FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "amd64" (line 1)                                                               0.0s
 => [internal] load metadata for docker.io/library/golang:1.23.1-alpine3.20                                                                                                  0.9s
 => [auth] library/golang:pull token for registry-1.docker.io                                                                                                                0.0s
 => [internal] load .dockerignore                                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                                              0.0s
 => [stage-0 1/4] FROM docker.io/library/golang:1.23.1-alpine3.20@sha256:ac67716dd016429be8d4c2c53a248d7bcdf06d34127d3dc451bda6aa5a87bc06                                    0.0s
 => => resolve docker.io/library/golang:1.23.1-alpine3.20@sha256:ac67716dd016429be8d4c2c53a248d7bcdf06d34127d3dc451bda6aa5a87bc06                                            0.0s
 => [internal] load build context                                                                                                                                            0.0s
 => => transferring context: 736B                                                                                                                                            0.0s
 => CACHED [stage-0 2/4] RUN go install github.com/DataDog/orchestrion@v1.1.0                                                                                                0.0s
 => CACHED [stage-0 3/4] WORKDIR /app                                                                                                                                        0.0s
 => ERROR [stage-0 4/4] RUN --mount=type=bind,target=/app go build -o main /app                                                                                             38.6s
------
 > [stage-0 4/4] RUN --mount=type=bind,target=/app go build -o main /app:
38.42 failed to resolve argv0 ("/usr/bin/qemu-x86_64") of 1: exec: "/usr/bin/qemu-x86_64": stat /usr/bin/qemu-x86_64: no such file or directory
38.42 failed to resolve argv0 ("/usr/bin/qemu-x86_64") of 1: exec: "/usr/bin/qemu-x86_64": stat /usr/bin/qemu-x86_64: no such file or directory
38.42 go: error obtaining buildID for go tool compile: exit status 255
38.42 go: error obtaining buildID for go tool compile: exit status 255
------

 1 warning found (use docker --debug to expand):
 - FromPlatformFlagConstDisallowed: FROM --platform flag should not use constant value "amd64" (line 1)
Dockerfile:9
--------------------
   7 |     ENV GOFLAGS="'-toolexec=orchestrion toolexec'"
   8 |
   9 | >>> RUN --mount=type=bind,target=/app go build -o main /app
  10 |
  11 |     CMD ["./main"]
--------------------
ERROR: failed to solve: process "/bin/sh -c go build -o main /app" did not complete successfully: exit code: 1
```
