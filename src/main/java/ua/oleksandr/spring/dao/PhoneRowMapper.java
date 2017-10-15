package ua.oleksandr.spring.dao;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class PhoneRowMapper implements RowMapper<Phone> {
@Override
public Phone mapRow(ResultSet resultSet, int i) throws SQLException {
        Phone phone=new Phone();
        phone.setId(resultSet.getLong("USER_ID"));
        phone.setPhoneNumber(resultSet.getString("PHONE_NUMBER"));
        return phone;
         }
        }
