package ua.oleksandr.spring.dao;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class UserDaoImpl implements UserDao {
    private static final String SQL_SELECT_ALL_USERS = "SELECT ID,FIRST_NAME,LAST_NAME,SALARY,DATE_OF_BIRTH FROM USERS";
    private static final String SQL_CREATE_USER = "INSERT INTO USERS (ID,FIRST_NAME,LAST_NAME,SALARY,DATE_OF_BIRTH) VALUES (seq_users.nextval,?,?,?,?)";
    private static final String SQL_UPDATE_USER = "UPDATE USERS SET FIRST_NAME=?,LAST_NAME=?,SALARY=?,DATE_OF_BIRTH=?WHERE ID = ?";
    private static final String SQL_DELETE_USER = "DELETE FROM USERS WHERE ID = ?";
    private static final String SQL_SELECT_USERS = "SELECT ID,FIRST_NAME,LAST_NAME,SALARY,DATE_OF_BIRTH FROM USERS WHERE ID=?";
    private static final String USER_COLS[] = {"ID", "FIRST_NAME", "LAST_NAME", "SALARY", "DATE_OF_BIRTH"};
    private final Logger log = LoggerFactory.getLogger(getClass());
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<User> getAll() {
        List<User> users = null;
        users = jdbcTemplate.query(SQL_SELECT_ALL_USERS, new BeanPropertyRowMapper(User.class));
        log.debug("getAll: {}", users.stream().map(User::getLastName).collect(Collectors.toList()));
        return users;
    }

    @Override
    public User getEntityByKey(Long key) {
        User user = null;
        user = (User) jdbcTemplate.queryForObject(SQL_SELECT_USERS, new Object[]{key}, new BeanPropertyRowMapper(User.class));
        log.debug("getEntityByKey {}", user);

        return user;

    }

    @Override
    public Long create(User entity) {
        boolean isSuccess = true;
        KeyHolder keyHolder = new GeneratedKeyHolder();
        log.debug("create User:{}", entity);

        jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(SQL_CREATE_USER, USER_COLS);
            ps.setString(1, entity.getFirstName());
            ps.setString(2, entity.getLastName());
            ps.setDouble(3, entity.getSalary());
            ps.setDate(4, Date.valueOf(entity.getDateOfBirth()));
            return ps;
        }, keyHolder);


        Long id = keyHolder.getKey().longValue();
        log.debug("create User Id :{}", id);

        isSuccess = (id != null);
        if (isSuccess) {
            entity.setId(id);
        }

        return isSuccess ? id : null;
    }

    @Override
    public boolean update(User entity) {
        boolean isSuccess = true;

        log.debug("update User:{}", entity);

        int numOfRows = jdbcTemplate.update(SQL_UPDATE_USER, entity.getFirstName(), entity.getLastName(), entity.getSalary(), entity.getDateOfBirth(),
                entity.getId());
        isSuccess = numOfRows > 0;
        log.debug("update isSuccess:{}", isSuccess);

        return isSuccess;
    }

    @Override
    public boolean delete(Long key) {
        boolean isSuccess = true;
        log.debug("delete key:{}", key);
        int numOfRows = jdbcTemplate.update(SQL_DELETE_USER, key);
        isSuccess = numOfRows > 0;
        log.debug("delete isSuccess:{}", isSuccess);

        return isSuccess;
    }
}
