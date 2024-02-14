package example;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.nio.charset.StandardCharsets;
import java.util.stream.Collectors;

public class HelloWorld 
{
  public static void main( String[] args ) throws IOException
  {
    try ( final InputStream is = HelloWorld.class.getResourceAsStream( "/world" ) )
    {
      final String world = new BufferedReader( new InputStreamReader( is, StandardCharsets.UTF_8 ) )
        .lines()
        .collect( Collectors.joining( "\n" ) );
      System.out.println( "Hello " + world );
    }
    final InetAddress ipAddress = InetAddress.getLocalHost();
    System.out.println( "IP of my system is : " + ipAddress.getHostAddress() );
  }
}
