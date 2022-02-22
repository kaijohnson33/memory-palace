# C#

## [Tour of C#](https://docs.microsoft.com/en-us/dotnet/csharp/tour-of-csharp/tutorials/hello-world?tutorial-step=2)

### Strings
- String concatenation: "Hello " + var
- String interpolation: `$` before opening quote: $"Hello {varName}"
  - $"{var.Length}" -- Length is a property
- String manip (.Trim(), .TrimEnd(), .TrimStart()) return new strings
- .Contains(subtring)

### New project

`dotnet new console -n NumbersInCSharp -o .`

The .NET 6 SDK also adds a set of implicit global using directives; don't need to create a Main() directly, but I just copied over using directives:

```
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
```

