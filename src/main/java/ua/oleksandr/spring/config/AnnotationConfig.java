package ua.oleksandr.spring.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import ua.oleksandr.spring.dao.UserDao;
import ua.oleksandr.spring.dao.UserDaoImpl;
import ua.oleksandr.spring.service.UserService;

import javax.sql.DataSource;

@Configuration
public class AnnotationConfig {
//    @Autowired
//    DataSource dataSource;
//
//    @Bean
//    public JdbcTemplate jdbcTemplate() {
//        JdbcTemplate jdbcTemplate = new JdbcTemplate();
//        jdbcTemplate.setDataSource(dataSource);
//        return jdbcTemplate;
//    }
//
//    @Bean
//    public UserDao userDao() {
//        UserDaoImpl userDao = new UserDaoImpl();
//
//        userDao.setJdbcTemplate(jdbcTemplate());
//        return userDao;
//    }
//
//    @Bean
//    public UserService userService() {
//        return new UserService();
//    }

}

