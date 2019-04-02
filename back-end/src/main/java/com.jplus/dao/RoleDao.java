package com.jplus.dao;

import com.jplus.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("roleDao")
public interface RoleDao {
    Role findRoleById(int id) throws Exception;

    List<Role> findAllRole() throws Exception;


}
