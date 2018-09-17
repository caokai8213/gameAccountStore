package cn.com.realm;
import org.apache.log4j.Logger;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 验证器，增加了登录次数校验功能
 */
public class RetryLimitCredentialsMatcher extends HashedCredentialsMatcher {
    private static final Logger log = Logger.getLogger(RetryLimitCredentialsMatcher.class);

    //集群中可能会导致出现验证多过3次的现象，因为AtomicInteger只能保证单节点并发
    private Cache<String, AtomicInteger> lgoinRetryCache;

    private int maxRetryCount = 3;

    private String lgoinRetryCacheName;

    public void setMaxRetryCount(int maxRetryCount) {
        this.maxRetryCount = maxRetryCount;
    }

    public RetryLimitCredentialsMatcher(CacheManager cacheManager, String lgoinRetryCacheName) {
        this.lgoinRetryCacheName = lgoinRetryCacheName;
        lgoinRetryCache = cacheManager.getCache(lgoinRetryCacheName);
    }

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info) {
        String username = (String) token.getPrincipal();
        //retry count + 1
        AtomicInteger retryCount = lgoinRetryCache.get(username);
        if (null == retryCount) {
            retryCount = new AtomicInteger(0);
            lgoinRetryCache.put(username, retryCount);
        }
        if (retryCount.incrementAndGet() > 3) {
            log.warn("username: " + username + " tried to login more than 3 times in period");
            throw new ExcessiveAttemptsException("username: " + username + " tried to login more than 3 times in period"
            );
        }
        boolean matches = super.doCredentialsMatch(token, info);
        if (matches) {
            //clear retry data
            lgoinRetryCache.remove(username);
        }
        return matches;
    }
}