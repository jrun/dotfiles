#!/usr/bin/env dtrace -s

#pragma D option quiet
#pragma D option switchrate=10hz

ruby*:::function-entry
{
  printf("%s[%d] %s %s %s:%d\n", execname, pid, copyinstr(arg0), copyinstr(arg1), copyinstr(arg2), arg3);

  k = copyinstr(arg0);
  m = copyinstr(arg1);
}

tick-5000hz
/k != 0/
{
  @[k, m] = count();
}
