using System;

namespace Assignemnt_1
{
    class Program
    {
        static void Main(string[] args)
        {

            var fruit = new
            {
                name = "Mango",
                amount = 5
            };
            Console.WriteLine("Fruit name : {0}", fruit.name);



        }
    }
}
