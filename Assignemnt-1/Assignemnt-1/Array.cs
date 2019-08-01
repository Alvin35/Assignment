using System;

namespace Assignemnt_1
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] animes = new string[3];
            animes[0] = "Attack on titan";
            animes[1] = "Seven sins";
            animes[2] = "One punch man";
            for(int i=0;i<animes.Length;i++)
            {
                Console.WriteLine(animes[i]);
            }

        }
        

    }

}