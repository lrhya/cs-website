
package base;

import com.jplus.service.UsersService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by rf on 2017/9/15.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-mybatis.xml","classpath:spring-mvc.xml"})
/**
 * 使用spring注解方式，进行单元测试，其他类使用spring测试，可以选择继承该类
 */
public class SpringTestBase {
    @Resource
    private UsersService usersService;

    @Test
    public void Test(){

        usersService.findUsersById(1);
    }
}
