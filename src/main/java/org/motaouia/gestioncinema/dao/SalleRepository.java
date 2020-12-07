package org.motaouia.gestioncinema.dao;

import org.motaouia.gestioncinema.models.Salle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource
public interface SalleRepository extends JpaRepository<Salle, Long>{

}
