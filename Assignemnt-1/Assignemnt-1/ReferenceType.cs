using System;

namespace Assignemnt_1
{
    class Program
    {
        static void Main(string[] args)
        {
            fruit ex1 = new fruit();
            fruit ex2 = new fruit();
            ex1.amount = 5;
            ex2 = ex1;
            ex2.amount = 6;
            Console.WriteLine(ex1.amount);
            Console.WriteLine(ex2.amount);


        }
        public class fruit
        {
           public string name;
           public int amount;
        }
    }

}