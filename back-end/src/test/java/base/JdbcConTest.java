
package base;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * sqlSessionFactory获取成功，说明数据库连接成功
 */
public class JdbcConTest {
    @Test
    public void conTest(){
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("spring-mybatis.xml");
        SqlSessionFactory sqlSessionFactory= (SqlSessionFactory) applicationContext.getBean("sqlSessionFactory");
        SqlSession sqlSession=sqlSessionFactory.openSession();
       System.out.println(sqlSession);
    }
}
