using System;

namespace Assignemnt_1
{
    class Program
    {
        static void Main(string[] args)
        {
            mango t1 = new mango("fajli",20);    

            t1.showData();
            t1.getAmount();
           
        }
    }
    public interface Ifruit
    {
        
        void showData();
        void getAmount();
    }
    public class mango : Ifruit
    {
         string name;
         int amount;

        
        public mango(string a,int  b)
        {
            name = a;
            amount = b;
           
        }
        public void getAmount()
        {
            Console.WriteLine("Amount: {0}",amount);
        }
        public void showData()
        {
            Console.WriteLine("So name {0} and amount {1}",name,amount);
            
        }
    }

}    

