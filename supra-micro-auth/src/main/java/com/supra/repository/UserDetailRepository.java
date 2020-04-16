package com.supra.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.supra.model.AuthUserEntity;

public interface UserDetailRepository extends JpaRepository<AuthUserEntity,Long> {

	 Optional<AuthUserEntity> findByUsername(String name);
}
