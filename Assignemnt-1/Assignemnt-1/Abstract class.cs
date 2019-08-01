using System;

namespace Assignemnt_1
{
    class Program
    {
        static void Main(string[] args)
        {
            fruit[] allfruits = new fruit[2];
            allfruits[0] = new mango();
            allfruits[1] = new banana();
            for(int i=0;i<2;i++)
            {
               allfruits[i].collect();
            }

        }
        public abstract class fruit
        {
            public string name;
            public int amount;
            public abstract void collect();
        }
        public class mango : fruit
        {
            public mango()
            {
                name = "Fojli";
                amount = 20;
            }
            public override void collect()
            {
                Console.WriteLine("The amount of {0} is {1}",name,amount);
            }
        }
        public class banana : fruit
        {
            public banana()
            {
                name = "Chompa";
                amount = 10;
            }
            public override void collect()
            {
                Console.WriteLine("The amount of {0} is {1}", name, amount);
            }
        }

    }

}
    

