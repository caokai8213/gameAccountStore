package cn.com.util;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;

public class SaltUtil
{
    public static ByteSource getSalt(String username, String password)
    {
        long timestamp = System.currentTimeMillis();
       // String hashAlgorithmName = "MD5";
        // String credentials = "root";
        ByteSource salt = ByteSource.Util
                .bytes(username + password+timestamp);
        // ByteSource salt = ByteSource.Util.bytes(salt1.toString());
        // System.out.println(salt1);
        // int hashIterations = 1024;
        // Object result = new SimpleHash(hashAlgorithmName, credentials, salt,
        // hashIterations);
        // System.out.println(result);
        return salt;
    }

    public static String getPassword(String password, String salt)
    {
        String hashAlgorithmName = "MD5";
        ByteSource salt1 = ByteSource.Util.bytes(salt);
        int hashIterations = 1024;
        Object result = new SimpleHash(hashAlgorithmName,password, salt1,
                hashIterations);
        return result.toString();
    }
}
