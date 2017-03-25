package filter;
/*package com.wanDa.filter;

import java.util.HashMap;

 * 权限分析
 
public class AccessAnalysis {  
    static String filepath;  
  
    HashMap<String, Access> map;  
  
    private static AccessAnalysis instance;  
  
    public boolean check(String url,SessionUserInfo id) {  
        while(url!=null){  
            if(map.containsKey(url)){  
                return map.get(url).validate(id);  
            }  
            url=UpUrl(url);  
        }  
        return false;  
    }  
  
    private String UpUrl(String url){  
        if(url==null)  
            return null;  
        if(url.contains("&")){  
            return url.split("&")[0];  
        }  
        if(url.contains("?"))  
            return url.split("\\?")[0];  
        if(url.contains("/")){  
            if("/".equals(url))  
                return null;  
            String t=url.substring(0,url.lastIndexOf("/"));  
            if(t.length()==0)  
                return "/";  
            return t;  
        }  
        return null;  
    }  
      
    public static AccessAnalysis getInstance() {  
        if (instance == null) {  
            synchronized (AccessAnalysis.class) {  
                if (instance == null) {  
                    instance = new AccessAnalysis();  
                }  
            }  
        }  
        return instance;  
    }  
  
    public static void init() {  
        Config config=ConfigManager.getConfig("wzz.eu.jk.Access");  
        String base=ConfigManager.getEnviroment("ContextRoot");  
        try {  
            filepath = base+config.getValue("path");  
        } catch (ConfigMissingException e) {  
            System.err.println("Error: AccessAnalyst init config" +  
                    " missing parameters "+e.getMessage());  
        }  
    }  
  
    private AccessAnalysis() {  
        map = new HashMap<String, Access>();  
        init();  
        readFile();  
    }  
  
    private void readFile() {  
        FileMan fm = new FileMan(filepath);  
        List<String> lines = fm.readLines();  
        fm.close();  
        String line;  
        String path;  
        Access access;  
        String[] g;  
        String[] gs;  
        for (int i = 0; i < lines.size(); i++) {  
            line = lines.get(i);  
            if(line.startsWith("#"))  
                continue;  
            gs = line.split(":");  
            path = gs[0];  
            access = new Access(path);  
            gs = gs[1].split("\\|");  
            for(int j=0;j<gs.length;j++){  
                g=gs[j].split(",");  
                for(int k=0;k<g.length;k++){  
                    access.addPrivilege(g[k], j);  
                    System.out.println(g[k]+" added to "+path);  
                }  
            }  
            map.put(path, access);  
        }  
    }  
}  */