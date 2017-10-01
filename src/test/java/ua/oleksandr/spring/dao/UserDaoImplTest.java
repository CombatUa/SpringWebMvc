package ua.oleksandr.spring.dao;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import java.time.LocalDate;

import static org.junit.Assert.*;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:Config/springmvc-servlet.xml"})
public class UserDaoImplTest {

    @Autowired
    UserDao userDao;

    @org.junit.Before
    public void setUp() throws Exception {

    }

    @org.junit.Test
    public void getAll() throws Exception {
        assertTrue(5 <= userDao.getAll().size());
    }

    @org.junit.Test
    public void getEntityByKey() throws Exception {
        assertEquals("TestLastName", userDao.getEntityByKey(1L).getLastName());
    }

    @org.junit.Test
    public void create() throws Exception {
        User user = getUser();
        assertNotNull(userDao.create(user));
        assertNotNull(user.getId());
    }

    @org.junit.Test
    public void update() throws Exception {
        User user = getUser();
        userDao.create(user);
        user.setLastName("TestLastName2");
        assertTrue(userDao.update(user));
        assertNotEquals(userDao.getEntityByKey(user.getId()).getLastName(), "TestLastName");
        userDao.delete(user.getId());
    }

    @org.junit.Test
    public void delete() throws Exception {
        User user = getUser();
        Long aLong = userDao.create(user);
        assertTrue(userDao.delete(aLong));
    }

    private User getUser() {
        User user = new User();
        user.setFirstName("TestFirstName");
        user.setLastName("TestLastName");
        user.setSalary(1000);
        user.setDateOfBirth(LocalDate.of(2000, 7, 17));
        return user;
    }

}