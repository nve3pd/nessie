{.push header: "sched.h".}
# for Namespaces
proc setns(fd: cint, nstype: cint): cint {.importc: "setns".}
{.pop.}

{.push header: "unistd.h".}
# for process clone
proc fork(): cint {.importc: "fork".}
proc execv[size: static[cint]](path: cstring, args: array[size, cstring]): cint {.importc: "execv".}
{.pop.}

proc run(cmd: string): int =
  var pid: cint
  pid = fork()
  if pid == -1:
    echo "fork failed"
  elif pid == 0:  # child process
    echo "child"
    var arr: array[4, cstring] = [cstring("sh"), cstring("-c"), cstring(cmd), nil]
    echo execv("/bin/sh", arr)
  else:  # parent process
    echo "parent"
  return 0

echo run("ls")
