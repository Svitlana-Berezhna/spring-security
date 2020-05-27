package ua.testing.repository;

import ua.testing.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * <h1>Spring Security (Registration, Authentication)</h1>
 *
 * @author Svitlana Berezhna
 * @version 1.0
 * @since 2020-03-09
 */
public interface RoleRepository extends JpaRepository<Role, Long> {
}
