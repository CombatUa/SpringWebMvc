package ua.oleksandr.spring.dao;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PhoneDaoImpl implements PhoneDao {
    private static final String SQL_SELECT_USER_PHONES = "SELECT  USER_ID, PHONE_NUMBER FROM PHONES WHERE USER_ID = ?";
    private static final String SQL_CREATE_USER_PHONES = "INSERT INTO PHONES (USER_ID, PHONE_NUMBER) VALUES (?,?)";
    private static final String SQL_DELETE_USER_PHONES = "DELETE FROM PHONES WHERE USER_ID = ?";
    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Phone> getAll(Long userId) {
        List<Phone> phones = new ArrayList<>();
        phones = jdbcTemplate.query(SQL_SELECT_USER_PHONES,new Object[]{userId},new PhoneRowMapper());
        return phones;
    }

    @Override
    public Long create(Long userId, List<Phone> phones) {
        jdbcTemplate.batchUpdate(SQL_CREATE_USER_PHONES, new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement preparedStatement, int i) throws SQLException {
                Phone  phone = phones.get(i);
                preparedStatement.setLong(1,userId);
                preparedStatement.setString(2,phone.getPhoneNumber());
            }

            @Override
            public int getBatchSize() {
                return phones.size();
            }
        }
        );
        return phones.get(0).getId();
    }

    @Override
    public boolean delete(Long userId) {
        jdbcTemplate.update(SQL_DELETE_USER_PHONES,userId);
        return true;
    }
}
