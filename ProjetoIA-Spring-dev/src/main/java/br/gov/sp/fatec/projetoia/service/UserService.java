package br.gov.sp.fatec.projetoia.service;

import br.gov.sp.fatec.projetoia.entity.UserEntity;
import br.gov.sp.fatec.projetoia.repository.UserRepository;
import br.gov.sp.fatec.projetoia.entity.PasswordGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;


import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private EmailService emailService;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    public List<UserEntity> getAllUsersEntities() {
        return userRepository.findAll();
    }

    public Optional<UserEntity> getUserEntityById(Long id) {
        return userRepository.findById(id);
    }

    @SuppressWarnings("static-access")
    public UserEntity createUserEntity(UserEntity userEntity) {
        String rawPassword = PasswordGenerator.generateRandomPassWord();
        String encodedPassword = passwordEncoder.encode(rawPassword);
        userEntity.setPassword(encodedPassword);

        UserEntity newUserEntity = userRepository.save(userEntity);

        emailService.sendEmail(userEntity.getEmail(), "Bem vindo ao nosso servidor!",
                "Sua conta foi criada com sucesso! Sua senha temporaria é: " + rawPassword);

        return newUserEntity;
    }

    public UserEntity updateUserEntity(Long id, UserEntity userEntityDetails) {
        UserEntity userEntity = userRepository.findById(id).orElseThrow(() -> new RuntimeException("Usuario não encontrado!"));

        userEntity.setNome(userEntityDetails.getNome());
        UserEntity.setEmail(UserEntity.getEmail());
        userEntity.setPapel(userEntityDetails.getPapel());

        if (userEntityDetails.getPassword() != null && !userEntityDetails.getPassword().isEmpty()){
            String encodedPassword = passwordEncoder.encode(userEntityDetails.getPassword());
            userEntity.setPassword(encodedPassword);
        }

        return userRepository.save(userEntity);
    }

    public void deleteUserEntity(Long id) {
        userRepository.deleteById(id);
    }

}