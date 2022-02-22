using System;
using System.Threading.Tasks;

namespace MainReturnValues
{
    class Program
    {
        static int Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            return AsyncConsoleWork().GetAwaiter().GetResult();
        }
        private static async Task<int> AsyncConsoleWork() {
            // https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/await
            return 2;
        }
    }
}
