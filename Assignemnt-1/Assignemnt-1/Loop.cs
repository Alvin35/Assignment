using System;

namespace Assignemnt_1
{
    class Program
    {
        static void Main(string[] args)
        {
            int a = 3,b = 3;
            string[] name = new string[5];
            name[0] = "A";
            name[1] = "B";
            name[2] = "C";

            for (int i=0;i<3;i++)
            {
                Console.WriteLine("This is for loop");
            }
            do
            {
                Console.WriteLine("This is do while");
                a--;
            } while (a > 0);

            while (b > 0)
            {
                Console.WriteLine("This is while loop");
                b--;
            }
            foreach(string n in name)
            {
                Console.WriteLine(n);
            }

        }
    }
}
