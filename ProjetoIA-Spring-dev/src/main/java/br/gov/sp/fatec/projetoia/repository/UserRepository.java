package br.gov.sp.fatec.projetoia.repository;

import br.gov.sp.fatec.projetoia.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {

}
