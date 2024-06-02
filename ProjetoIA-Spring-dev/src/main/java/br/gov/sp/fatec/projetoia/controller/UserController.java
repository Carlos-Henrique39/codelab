package br.gov.sp.fatec.projetoia.controller;

import br.gov.sp.fatec.projetoia.entity.UserEntity;
import br.gov.sp.fatec.projetoia.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/users")
@CrossOrigin
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping
    public List<UserEntity> getAllUsersEntities() {
        return userService.getAllUsersEntities();
    }

    @GetMapping("/{id}")
    public ResponseEntity<UserEntity> getUserEntityById(@PathVariable Long id) {
        UserEntity userEntity = userService.getUserEntityById(id).orElseThrow(() -> new RuntimeException("Nenhum usuario encontradoen"));
        return ResponseEntity.ok(userEntity);
    }

    @PostMapping
    public UserEntity createUserEntity(@RequestBody UserEntity user) {
        return userService.createUserEntity(user);
    }

    @PutMapping("/{id}")
    public ResponseEntity<UserEntity> updateUserEntity(@PathVariable Long id, @RequestBody UserEntity userDetails) {
        UserEntity updatedUser = userService.updateUserEntity(id, userDetails);
        return ResponseEntity.ok(updatedUser);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUserEntity(@PathVariable Long id) {
        userService.deleteUserEntity(id);
        return ResponseEntity.noContent().build();
    }
}
