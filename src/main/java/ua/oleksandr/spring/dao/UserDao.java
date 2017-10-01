package ua.oleksandr.spring.dao;

import java.util.List;

public interface UserDao {
    List<User> getAll();

    User getEntityByKey(Long key);

    Long create(User entity);

//    boolean update(Long key, User entity);

    boolean update(User entity);

    boolean delete(Long key);
}
