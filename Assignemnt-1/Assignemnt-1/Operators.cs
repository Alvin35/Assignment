using System;

namespace Assignemnt_1
{
    class Program
    {
        static void Main(string[] args)
        {
          int  x = 01;
          int  y = 11;
          var z = x & y;
          Console.WriteLine(z);
          z = x ^ y;
          Console.WriteLine(z);
          int a = 3, b = 5;
          z = a > b ? a : b;
          Console.WriteLine(z);
           
        }
    }
}
