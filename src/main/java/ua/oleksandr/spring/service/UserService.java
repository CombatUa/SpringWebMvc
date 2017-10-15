package ua.oleksandr.spring.service;

import ua.oleksandr.spring.dao.User;
import ua.oleksandr.spring.dao.UserDao;

import java.util.List;

public class UserService {
    UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public List<User> getAll() {
        return userDao.getAll();
    }

    public boolean delete(Long id) {
        return userDao.delete(id);
    }

    public Long create(User user) {
        return userDao.create(user);
    }

    public boolean update(User user) {
        return userDao.update(user);
    }

    public User getUser(Long id) {
        return userDao.getEntityByKey(id);
    }
}
