#!/usr/bin/env ruby
#
# Trace method calls for a given, fully qualified, module.
# If a module is not given all method calls are traced.
#
# This script requires the traced Ruby process to have
# dtrace probes. For example, tenderlove's probes branch
# (https://github.com/tenderlove/ruby-1/tree/probes).
#

fq_module = ARGV[0]

d_script = "ruby*:::function-entry\n"
d_script << "/copyinstr(arg0) == \"#{fq_module}\"/\n" if fq_module
d_script << <<-ACTION
{
  printf("%s[%d] %s %s %s:%d\\n", execname, pid, copyinstr(arg0), copyinstr(arg1), copyinstr(arg2), arg3);
}
ACTION

exec "dtrace -Zqn '#{d_script}'"
