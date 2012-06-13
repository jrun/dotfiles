#!/usr/bin/env dtrace -s

#pragma D option quiet
#pragma D option switchrate=10hz

dtrace:::BEGIN
{
  start = timestamp;
}

dtrace:::END
{
  end = timestamp;
  elapsed = end - start;

  printf("\nTOTAL: %d", elapsed / 1000000);
}
