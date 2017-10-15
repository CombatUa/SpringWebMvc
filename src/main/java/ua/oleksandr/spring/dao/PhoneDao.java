package ua.oleksandr.spring.dao;

import java.util.List;

public interface PhoneDao {
    List<Phone> getAll(Long userId);
    Long create(Long userId, List<Phone> phones);
    boolean delete(Long userId);
}
