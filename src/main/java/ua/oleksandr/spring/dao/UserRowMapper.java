package ua.oleksandr.spring.dao;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet resultSet, int i) throws SQLException {
        User user=new User();
        //ID,FIRST_NAME,LAST_NAME,SALARY,DATE_OF_BIRTH
        user.setId(resultSet.getLong("ID"));
        user.setFirstName(resultSet.getString("FIRST_NAME"));
        user.setLastName(resultSet.getString("LAST_NAME"));
        user.setSalary(resultSet.getDouble("SALARY"));
        user.setDateOfBirth(resultSet.getDate("DATE_OF_BIRTH").toLocalDate());
        return user;
    }
}
