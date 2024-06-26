package br.gov.sp.fatec.projetoia.repository;

import br.gov.sp.fatec.projetoia.entity.EntradaRedZoneEntity;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface EntradaRedZoneRepository extends JpaRepository<EntradaRedZoneEntity, Long> {

    @Query("SELECT COUNT(e) FROM EntradaRedZoneEntity e WHERE DATE(e.data) BETWEEN :startDate AND :endDate")
    long countByDateBetween(@Param("startDate") LocalDate startDate, @Param("endDate") LocalDate endDate);

    @Query("SELECT COUNT(e) FROM EntradaRedZoneEntity e WHERE (:redZoneId IS NULL OR e.redZone.id = :redZoneId)")
    Long countPeopleInRedZone(@Param("redZoneId") Long redZoneId);

    List<EntradaRedZoneEntity> findByRedZoneStatus(boolean status);

    List<EntradaRedZoneEntity> findByRedZoneStatusAndDataBetweenOrderByData(boolean status, LocalDateTime startDate, LocalDateTime endDate);

    List<EntradaRedZoneEntity> findByRedZoneStatusAndDataGreaterThanEqualOrderByData(boolean status, LocalDateTime date);

    @Query("SELECT e FROM EntradaRedZoneEntity e " +
           "WHERE e.redZone.status = :status " +
           "AND (:areaId IS NULL OR e.redZone.area.id = :areaId) " +
           "AND (:redZoneId IS NULL OR e.redZone.id = :redZoneId) " +
           "AND (:startDate IS NULL OR e.data >= :startDate) " + 
           "AND (:endDate IS NULL OR e.data <= :endDate) " + 
           "ORDER BY e.data")
    List<EntradaRedZoneEntity> findByFilters(
        @Param("status") boolean status, 
        @Param("areaId") Long areaId,
        @Param("redZoneId") Long redZoneId,
        @Param("startDate") LocalDateTime startDate, 
        @Param("endDate") LocalDateTime endDate);

}
