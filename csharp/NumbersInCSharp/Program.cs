using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace NumbersInCSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 5, b = 6;
            if (a + b > 10)
                Console.WriteLine("Hello World!");

            var names = new List<String> { "<name>", "Ana", "Felipe"};
            foreach (var name in names) {
                Console.WriteLine($"Hello {name.ToUpper()}!");
            }
        }
    }
}
