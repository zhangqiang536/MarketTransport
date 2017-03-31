package com.market.pc.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigProperties {
	public static String getValue(String key) {  
        Properties props = new Properties();  
        InputStream inputStream = null;  
        String value = "";
        try {  
            inputStream = ConfigProperties.class.getResourceAsStream("/spring/properties/config.properties");  
            props.load(inputStream);  
            value = (String) props.get(key);  
        } catch (IOException ex) {  
            ex.printStackTrace();  
        }
		return value;  
    }  
}
