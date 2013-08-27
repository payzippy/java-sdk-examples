package pg;

import java.util.Properties;

public class ConfigReader
{
	public static Properties config = new Properties();
	static
	{
		try
		{
			config.load(ConfigReader.class.getClassLoader().getResourceAsStream("config.properties"));
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
