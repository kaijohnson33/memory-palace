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

### Branching

if true
	// branch
else
	// else branch

Also can use brackets if (true) { /* blah */ }

while (), do {...} while(); and for() all as expected

foreach (var x in xlist) { }

### List

var names = new List<string> {... }

- Add(), .Remove()
- `[ ]` for indexing into list.
- IndexOf (-1 if doesn't exist)
- .Sort() sorts in place

## Structure

C# programs consist of one or more files. Each file contains zero or more namespaces. A namespace contains types such as classes, structs, interfaces, enumerations, and delegates, or other namespaces. 

- Only one Main - otherwise must compile your program with the StartupObject compiler option to specify which Main method to use as the entry point
- Main can have void, int or Task Task<int> return type
  - only if returning Task can have async
- GetCommandLineArgs() with VS to create windows apps (same elsewhere?)

## Classes

- default access is private

## Await [doc](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/await)

- suspends evaluation of enclosing async method until async operation represented by operand completes
- away does not block the thread that evaluates the async method
- When await suspends the enclosing async method, control returns to the caller
- Calling `Task<int> downloading = Download();` where `Download()` is `async` will run Download until it gets to an `await` in the method, then returns control
  - when caller needs result, get by `int result = await downloading`
- when async task throws an exception it is *faulted* - Task holds the exception thrown in Task.Execution property
  - this is a System.AggregateException b/c it can be > 1 exception
  - it's added to AggregateException.InnerExceptions
  - this AggregateException is created w/the first exception
- Awaiting a faulted task gets the FIRST EXCEPTION
  - **Need to examine the `Exception` property if multiple exceptions might happen**

`Task.WhenAll` returns a Task that completes when all have completed in side (also `WhenAny`)

## Exceptions

- `throw new InvalidOperationException("blah");` stops execution and returns
  - when in an async method, gives back the error when await'ed

## Attributes

Attribute name in brackets, is actually suffixed by Attribute (DllImportAttribute) but you can drop that in code (DllImport)

- can have parameters - positional, unnamed or named
- *target* is what it applies to, usually it's the element that follws it
  - can give specific target: `[module: CLSCompliant(true)]` or `[method: ValidatedContract]`
- Create your own with class that derives from `System.Attribute`

# ASP.NET core 3.1

https://docs.microsoft.com/en-us/aspnet/core/fundamentals/?view=aspnetcore-3.1&tabs=macos

## Dependency Injection

https://www.c-sharpcorner.com/article/understanding-addtransient-vs-addscoped-vs-addsingleton-in-asp-net-core/

- Transient - created each time they are requested; good for lightweight stateless services
- Scoped: Once per request
- Singleton: created once

## Logging

Providers store logs (Console displays).

- Host is created in Program.cs
