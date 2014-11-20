using System;
 
public class TestPnt
{
    
    static public void Main ()
    {
        gp_Pnt p = new gp_Pnt(3.0, 4.0, 5.0);
        System.Console.WriteLine("X    " + p.X());
        //Console.WriteLine ("Hello Mono World");
    }
}
