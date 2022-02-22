#!/bin/sh
# https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/program-structure/main-command-line

set -ux

dotnet run

# exit code of last command
echo $?
