public class TestMakeVertex{
    
    	public static void main(final String[] args)
	{   
        System.out.println("Hello, World");
        System.loadLibrary("gp");
        System.loadLibrary("BRepBuilderAPI");
        System.out.println(new BRepBuilderAPI_MakeVertex(new gp_Pnt(0,0,0)));
    }
}
